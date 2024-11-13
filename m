Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AFDD462D3
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54054882AF;
	Wed, 13 Nov 2024 16:24:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560AD882AF;
 Wed, 13 Nov 2024 16:24:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3628428428864610276=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pmu=3A_PMU_interface_for?=
 =?utf-8?q?_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 16:24:29 -0000
Message-ID: <173151506933.3663616.18123624086458582199@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
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

--===============3628428428864610276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pmu: PMU interface for Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/139121/
State : failure

== Summary ==

CI Bug Log - changes from xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full -> xe-pw-139121v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139121v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139121v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139121v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html

  * {igt@xe_eudebug@exec-queue-placements} (NEW):
    - shard-adlp:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@xe_eudebug@exec-queue-placements.html
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_eudebug@exec-queue-placements.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_eudebug@exec-queue-placements.html
    - shard-lnl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_eudebug@exec-queue-placements.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [PASS][6] -> [FAIL][7] +4 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][14] -> [DMESG-WARN][15] +1 other test dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_oa@stress-open-close:
    - shard-lnl:          [PASS][16] -> [FAIL][17] +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@xe_oa@stress-open-close.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_oa@stress-open-close.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][18] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][19] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  
New tests
---------

  New tests have been introduced between xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full and xe-pw-139121v5_full:

### New IGT tests (1) ###

  * igt@xe_eudebug@exec-queue-placements:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-139121v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#3086]) +9 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@core_hotunplug@hotreplug.html
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#1885]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1885])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][25] -> [FAIL][26] ([Intel XE#3339])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_3d:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2423])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_3d.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_3d.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1033]) +2 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2136]) +26 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2327])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1407])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1874]) +4 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#787]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2907]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#1195])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2887]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#787]) +129 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#2907])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1152]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#306])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2325])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#373]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#373])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#373])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_chamelium_frames@vga-frame-dump.html
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2252]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_content_protection@legacy@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#3304])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1178])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2320])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1424]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#2423] / [i915#2575]) +103 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#1475])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#307])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#701])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#2882])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#3422]) +3 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#3403])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-bmg:          [PASS][77] -> [INCOMPLETE][78] ([Intel XE#2635])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-1/igt@kms_flip@dpms-off-confusion.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-1/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#886]) +7 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#2882])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#3321])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1401] / [Intel XE#1745])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#3194]) +3 other tests dmesg-fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [FAIL][93] ([Intel XE#2333]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2136]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#651]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#656]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#651]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#653]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#653]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#3404])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#3012])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#1471]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_plane_cursor@overlay.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#616]) +10 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#455]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2763]) +14 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2391])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#718])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1439] / [Intel XE#3141])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#836])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#2446])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2446])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1489])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2893]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#1489]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1489])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#3414])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#362])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][130] -> [FAIL][131] ([Intel XE#899]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#756])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1280] / [Intel XE#455])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1123])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-client:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#2905])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2905]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2905]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2905]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-bmg:          [PASS][139] -> [INCOMPLETE][140] ([Intel XE#1473])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@xe_evict@evict-beng-small-multi-vm-cm.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1130]) +31 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1130]) +161 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1392])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1392])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2322]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-basic-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#288]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_exec_fault_mode@once-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#288]) +10 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2360])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][152] -> [TIMEOUT][153] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2229]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1008])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_mmap@vram.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][156] -> [DMESG-WARN][157] ([Intel XE#2953] / [Intel XE#3086])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@xe_module_load@many-reload.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2541]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [PASS][159] -> [FAIL][160] ([Intel XE#2514])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
    - shard-bmg:          [PASS][161] -> [FAIL][162] ([Intel XE#2514])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][163] ([Intel XE#2514])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][164] ([Intel XE#2514])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@stress-open-close@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][165] ([Intel XE#2976])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_oa@stress-open-close@ccs-0.html
    - shard-bmg:          NOTRUN -> [FAIL][166] ([Intel XE#2976])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-6/igt@xe_oa@stress-open-close@ccs-0.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2541])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2284] / [Intel XE#366])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [PASS][169] -> [DMESG-WARN][170] ([Intel XE#3184])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-5/igt@xe_pm@d3hot-multiple-execs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#2284] / [Intel XE#366])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][172] -> [ABORT][173] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][174] -> [ABORT][175] ([Intel XE#1794])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [PASS][176] -> [ABORT][177] ([Intel XE#2625]) +1 other test abort
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][178] -> [FAIL][179] ([Intel XE#958])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][181] -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@core_getversion@all-cards.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1885]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@core_hotunplug@hotrebind.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#3086]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@core_hotunplug@hotunbind-rebind.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2134]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@fbdev@write.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@fbdev@write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][189] ([Intel XE#911]) -> [PASS][190] +3 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2423] / [i915#2575]) -> [PASS][192] +112 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
    - shard-lnl:          [FAIL][193] ([Intel XE#1701]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#1426]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2136]) -> [PASS][198] +34 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][199] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][201] ([Intel XE#1242]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][203] ([Intel XE#3052]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][205] ([Intel XE#1874]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][207] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-adlp:         [TIMEOUT][209] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][210] +3 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#877]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [FAIL][213] ([Intel XE#1475]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][215] -> [PASS][216] +3 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][217] ([Intel XE#2882]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][219] ([Intel XE#2597]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][221] -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][223] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [INCOMPLETE][225] ([Intel XE#2635]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][227] -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][229] ([Intel XE#886]) -> [PASS][230] +3 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][231] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear:
    - shard-lnl:          [FAIL][233] ([Intel XE#1491]) -> [PASS][234] +1 other test pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][236] +12 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][237] ([Intel XE#1861]) -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][239] ([Intel XE#1503]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][241] ([Intel XE#1430]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2446]) -> [PASS][244] +2 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][245] ([Intel XE#2042]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [DMESG-WARN][247] ([Intel XE#3184]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423]) -> [PASS][250] +2 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@testdisplay.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@testdisplay.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [FAIL][251] ([Intel XE#2667]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-idle.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2229]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][255] ([Intel XE#2136]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [FAIL][257] ([Intel XE#2249]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][259] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@xe_pm@s4-basic.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][261] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][263] ([Intel XE#958]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][265] ([Intel XE#1081]) -> [PASS][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
    - shard-adlp:         [DMESG-WARN][267] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1130]) -> [PASS][270] +200 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2423] / [i915#2575]) -> [SKIP][272] ([Intel XE#873])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#316]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][275] ([Intel XE#877]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2351])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][278] ([Intel XE#316]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#316]) -> [SKIP][280] ([Intel XE#2136]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#316]) -> [SKIP][282] ([Intel XE#2136] / [Intel XE#2351])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][283] ([Intel XE#1242]) -> [DMESG-FAIL][284] ([Intel XE#3194])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1124]) -> [SKIP][286] ([Intel XE#2136]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#619]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#610]) -> [SKIP][290] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [SKIP][292] ([Intel XE#1124]) +8 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][293] ([Intel XE#3194]) -> [FAIL][294] ([Intel XE#1231] / [Intel XE#1242])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][295] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][296] ([Intel XE#3194])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][297] ([Intel XE#1231] / [Intel XE#1242]) -> [FAIL][298] ([Intel XE#1242])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1124]) -> [SKIP][300] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#607]) -> [SKIP][302] ([Intel XE#2136])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#610])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#1124]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#2191]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2191]) -> [SKIP][310] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#367]) +6 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#367]) -> [SKIP][314] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#2907]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][320] ([Intel XE#2136]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][321] -> [INCOMPLETE][322] ([Intel XE#1195])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][323] -> [SKIP][324] ([Intel XE#455] / [Intel XE#787])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136]) -> [FAIL][326] ([Intel XE#616])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][328] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#306]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#306]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#373]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2423] / [i915#2575]) -> [SKIP][338] ([Intel XE#373]) +11 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][339] ([Intel XE#1178]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([Intel XE#455]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#308]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2423] / [i915#2575]) -> [SKIP][346] ([Intel XE#308]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#323]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#323]) -> [SKIP][350] ([Intel XE#2423] / [i915#2575])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#307]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#455]) -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2351])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][356] ([Intel XE#455]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#703]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1137]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#1135]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [FAIL][363] -> [SKIP][364] ([Intel XE#2423] / [i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2136]) -> [SKIP][366] ([Intel XE#455]) +6 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#455]) -> [SKIP][368] ([Intel XE#2136]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][369] ([i915#5274]) -> [SKIP][370] ([Intel XE#2423] / [i915#2575])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#651]) -> [SKIP][372] ([Intel XE#2136]) +23 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][374] ([Intel XE#651]) +11 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136]) -> [SKIP][376] ([Intel XE#651]) +23 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#651]) -> [SKIP][378] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [TIMEOUT][379] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][380] ([Intel XE#1861])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][382] ([Intel XE#658]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#653]) -> [SKIP][384] ([Intel XE#2136]) +25 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][386] ([Intel XE#653]) +10 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136]) -> [SKIP][388] ([Intel XE#653]) +30 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#653]) -> [SKIP][390] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#605]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         [TIMEOUT][393] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][394] ([Intel XE#455])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_hdr@bpc-switch.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2423] / [i915#2575]) -> [FAIL][396] ([Intel XE#3312] / [Intel XE#3404])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2925]) -> [SKIP][398] ([Intel XE#2136])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#346]) -> [SKIP][400] ([Intel XE#2136])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#2927])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][403] ([Intel XE#1035]) -> [INCOMPLETE][404] ([Intel XE#1035] / [Intel XE#1195])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_plane@pixel-format.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2423] / [i915#2575]) -> [FAIL][406] ([Intel XE#616])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][407] ([Intel XE#361]) -> [SKIP][408] ([Intel XE#2423] / [i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2423] / [i915#2575]) -> [SKIP][412] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#2938])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#870])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#870]) -> [SKIP][418] ([Intel XE#2136])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][420] ([Intel XE#1122])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#908]) -> [SKIP][422] ([Intel XE#2136] / [Intel XE#2351])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1489]) -> [SKIP][424] ([Intel XE#2136]) +10 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#1489]) +10 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#1122]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][430] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][432] ([Intel XE#2136]) +8 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][434] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][436] ([Intel XE#2351])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136]) -> [SKIP][438] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr2-basic.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#2939])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2423] / [i915#2575]) -> [SKIP][442] ([Intel XE#3414]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2423] / [i915#2575]) -> [SKIP][444] ([Intel XE#1127]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#3414]) -> [SKIP][446] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#455]) -> [SKIP][448] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][449] ([Intel XE#2509]) -> [SKIP][450] ([Intel XE#2426])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#330]) -> [SKIP][452] ([Intel XE#2423] / [i915#2575])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2423] / [i915#2575]) -> [SKIP][454] ([Intel XE#756]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#756]) -> [SKIP][456] ([Intel XE#2423] / [i915#2575])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][458] ([Intel XE#1130])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1130]) -> [SKIP][460] ([Intel XE#1280] / [Intel XE#455])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [SKIP][462] ([Intel XE#1123]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1123]) -> [SKIP][464] ([Intel XE#1130])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1126]) -> [SKIP][466] ([Intel XE#1130])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1130]) -> [SKIP][468] ([Intel XE#2905]) +15 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2905]) -> [SKIP][470] ([Intel XE#1130]) +13 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [FAIL][471] ([Intel XE#1000]) -> [TIMEOUT][472] ([Intel XE#1473])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#288]) -> [SKIP][474] ([Intel XE#1130]) +26 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1130]) -> [SKIP][476] ([Intel XE#288]) +27 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1130]) -> [SKIP][478] ([Intel XE#2360])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-adlp:         [DMESG-WARN][479] ([Intel XE#3343]) -> [DMESG-WARN][480] ([Intel XE#3086] / [Intel XE#3343])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe.html
    - shard-dg2-set2:     [DMESG-WARN][481] ([Intel XE#3343]) -> [SKIP][482] ([Intel XE#1130])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][483] ([Intel XE#2833]) -> [SKIP][484] ([Intel XE#1192] / [Intel XE#3026])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [SKIP][486] ([Intel XE#560])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#512]) -> [SKIP][488] ([Intel XE#1130])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_mmap@small-bar.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#2541]) -> [SKIP][490] ([Intel XE#1130]) +7 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#2541]) +12 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1130]) -> [SKIP][494] ([Intel XE#2284] / [Intel XE#366])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][496] ([Intel XE#1130])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#944]) -> [SKIP][498] ([Intel XE#1130]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [SKIP][500] ([Intel XE#944]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1130]) -> [DMESG-WARN][502] ([Intel XE#2919])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_wedged@basic-wedged.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
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
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3422
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8105 -> IGT_8106
  * Linux: xe-2221-169c7cd31a373ed31054abb423981856eb5fb119 -> xe-pw-139121v5

  IGT_8105: 8105
  IGT_8106: 05659c7f2840938c4977668143e6c60a46ca509d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2221-169c7cd31a373ed31054abb423981856eb5fb119: 169c7cd31a373ed31054abb423981856eb5fb119
  xe-pw-139121v5: 139121v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/index.html

--===============3628428428864610276==
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
<tr><td><b>Series:</b></td><td>drm/xe/pmu: PMU interface for Xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139121/">https://patchwork.freedesktop.org/series/139121/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full -&gt; xe-pw-139121v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139121v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139121v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139121v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug@exec-queue-placements} (NEW):</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@xe_eudebug@exec-queue-placements.html">SKIP</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_eudebug@exec-queue-placements.html">SKIP</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_eudebug@exec-queue-placements.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_eudebug@exec-queue-placements.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@xe_oa@stress-open-close.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_oa@stress-open-close.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full and xe-pw-139121v5_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_eudebug@exec-queue-placements:<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139121v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +9 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_3d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +129 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3422">Intel XE#3422</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403">Intel XE#3403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-1/igt@kms_flip@dpms-off-confusion.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-1/igt@kms_flip@dpms-off-confusion.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_hdr@brightness-with-hdr@pipe-a-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@xe_eudebug@basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@xe_evict@evict-beng-small-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@xe_evict@evict-beng-small-multi-vm-cm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +161 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_exec_fault_mode@once-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_oa@stress-open-close@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-6/igt@xe_oa@stress-open-close@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-5/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +112 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-5/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@testdisplay.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-hammer:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +200 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_hdr@bpc-switch.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139121v5/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8105 -&gt; IGT_8106</li>
<li>Linux: xe-2221-169c7cd31a373ed31054abb423981856eb5fb119 -&gt; xe-pw-139121v5</li>
</ul>
<p>IGT_8105: 8105<br />
  IGT_8106: 05659c7f2840938c4977668143e6c60a46ca509d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2221-169c7cd31a373ed31054abb423981856eb5fb119: 169c7cd31a373ed31054abb423981856eb5fb119<br />
  xe-pw-139121v5: 139121v5</p>

</body>
</html>

--===============3628428428864610276==--
