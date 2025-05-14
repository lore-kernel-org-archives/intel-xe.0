Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71DFC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 14:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A0010E22B;
	Wed, 14 May 2025 14:11:28 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56410E22B;
 Wed, 14 May 2025 14:11:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0312741322078868740=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Add_no?=
 =?utf-8?q?=5Fpsr=5Freason_to_PSR_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 14:11:26 -0000
Message-ID: <174723188672.77995.130658865033283396@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513113526.2758433-1-michal.grzelak@intel.com>
In-Reply-To: <20250513113526.2758433-1-michal.grzelak@intel.com>
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

--===============0312741322078868740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add no_psr_reason to PSR debugfs
URL   : https://patchwork.freedesktop.org/series/148957/
State : failure

== Summary ==

CI Bug Log - changes from xe-3085-84da78f30dc4c78f6c328ed142db458457035da0_FULL -> xe-pw-148957v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148957v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148957v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148957v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][5] -> [SKIP][6] +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_sequence@get-busy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_sequence@get-busy.html

  * igt@xe_exec_reset@virtual-gt-reset:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-9/igt@xe_exec_reset@virtual-gt-reset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-1/igt@xe_exec_reset@virtual-gt-reset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-mlock:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mmap-mlock.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-mmap-mlock.html

  * igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:
    - shard-bmg:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][13] ([Intel XE#656]) -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-adlp:         [SKIP][15] ([Intel XE#651]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-adlp:         [SKIP][17] ([Intel XE#1489]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         [SKIP][19] ([Intel XE#1122]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-adlp:         [SKIP][21] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr@psr2-sprite-render.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         [SKIP][23] ([Intel XE#330]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-adlp:         [SKIP][25] ([Intel XE#455]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_vrr@flip-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_vrr@flip-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-148957v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2134])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@fbdev@unaligned-write.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@fbdev@unaligned-write.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +1 other test dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_async_flips@invalid-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1407])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][35] -> [SKIP][36] ([Intel XE#4996]) +12 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#316]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1477])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#367]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2314] / [Intel XE#2894])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2314] / [Intel XE#2894])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +111 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#787]) +14 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#3862])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#3113])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2887]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2325])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#373]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2252]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#373]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2341])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][66] ([Intel XE#1178])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#3278])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2320])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#308])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#4208] / [i915#2575]) +56 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2291]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#4667])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1508])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4494] / [i915#3804])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#4354])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#4422])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#3321]) +3 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#301]) +3 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#310]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1421])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2316])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2316]) +12 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#3321]) +3 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-panning:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#4173])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-1/igt@kms_flip@flip-vs-panning.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-9/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][97] ([Intel XE#2049] / [Intel XE#2597])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][98] ([Intel XE#886]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401] / [Intel XE#1745])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][103] -> [DMESG-FAIL][104] ([Intel XE#4543]) +1 other test dmesg-fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#352])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2312]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#656]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4141]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][112] ([Intel XE#4543])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2311])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#651]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2313])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#656]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1470] / [Intel XE#2853])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#3012])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#3012])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2925])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#4596])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4596])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2763]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2763]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1909])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_prop_blob@basic:
    - shard-adlp:         [PASS][130] -> [SKIP][131] ([Intel XE#4950]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_prop_blob@basic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2893])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1489])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1489])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1122])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4609])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#4208]) +8 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1406]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#3414] / [Intel XE#3904])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#3414])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#455]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [PASS][144] -> [ABORT][145] ([Intel XE#4979]) +1 other test abort
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#1499])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1499])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#455] / [Intel XE#488])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4837]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#4837])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#688])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][153] -> [SKIP][154] ([Intel XE#4208]) +124 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2322]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1392])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1392]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#1392]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@once-userptr-free:
    - shard-adlp:         [PASS][160] -> [SKIP][161] ([Intel XE#4945]) +20 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec_compute_mode@once-userptr-free.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_compute_mode@once-userptr-free.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#288]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#4837]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@many-mmap-file:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#4915]) +31 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_system_allocator@many-mmap-file.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4943]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#4943]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][167] -> [FAIL][168] ([Intel XE#5018])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#4045])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2457])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195]) -> ([PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [SKIP][219], [PASS][220], [PASS][221]) ([Intel XE#2457])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-1/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#379])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#977])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#979])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][226] ([Intel XE#1173])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2284])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][228] -> [ABORT][229] ([Intel XE#1794])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#4733])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#4733])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#944])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#4130])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - shard-adlp:         [PASS][234] -> [SKIP][235] ([Intel XE#4945] / [Intel XE#4996]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][236] ([Intel XE#4208]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html

  * igt@intel_sysfs_debugfs@xe-base:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@intel_sysfs_debugfs@xe-base.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][240] ([Intel XE#4543]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][242] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][244] ([Intel XE#3862]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][246] ([Intel XE#2291]) -> [PASS][247] +7 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][248] ([Intel XE#1475]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][250] ([Intel XE#1340]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][252] ([Intel XE#3009]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_dp_aux_dev.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][254] ([Intel XE#4294]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][256] ([Intel XE#2373]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][258] ([Intel XE#2316]) -> [PASS][259] +8 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][260] ([Intel XE#301]) -> [PASS][261] +3 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-bmg:          [FAIL][262] ([Intel XE#3321]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][264] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][265] +3 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][267] +7 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_getfb@getfb-handle-not-fb:
    - shard-adlp:         [DMESG-WARN][268] ([Intel XE#4173]) -> [PASS][269] +2 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_getfb@getfb-handle-not-fb.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-6/igt@kms_getfb@getfb-handle-not-fb.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][270] ([Intel XE#1503]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208] / [i915#2575]) -> [PASS][273] +48 other tests pass
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_lease@invalid-create-leases.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_lease@invalid-create-leases.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][274] ([Intel XE#4227]) -> [PASS][275] +1 other test pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-8/igt@kms_vrr@flipline.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1392]) -> [PASS][277] +4 other tests pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][278] ([Intel XE#5018]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][280] ([Intel XE#1794]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][282] ([Intel XE#1794]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [PASS][285] +118 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_vm@invalid-extensions.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_vm@invalid-extensions.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#316]) -> [SKIP][287] ([Intel XE#2351] / [Intel XE#4208])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#316]) -> [SKIP][289] ([Intel XE#4208]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][290] ([Intel XE#316]) -> [SKIP][291] ([Intel XE#4947] / [Intel XE#4996])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208]) -> [SKIP][293] ([Intel XE#316])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][295] ([Intel XE#1124]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][296] ([Intel XE#316]) -> [SKIP][297] ([Intel XE#4996])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][298] ([Intel XE#4543]) -> [SKIP][299] ([Intel XE#4996])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1124]) -> [SKIP][301] ([Intel XE#4208]) +6 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-adlp:         [SKIP][302] ([Intel XE#1124]) -> [SKIP][303] ([Intel XE#4996])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#610]) -> [SKIP][305] ([Intel XE#4208])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1124]) -> [SKIP][307] ([Intel XE#2351] / [Intel XE#4208])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#4208]) -> [SKIP][309] ([Intel XE#1124]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2191]) -> [SKIP][311] ([Intel XE#4208] / [i915#2575])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#367]) -> [SKIP][313] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#4208] / [i915#2575]) -> [SKIP][315] ([Intel XE#367]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][316] ([Intel XE#367]) -> [SKIP][317] ([Intel XE#4996])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][319] ([Intel XE#4208]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2907]) -> [SKIP][321] ([Intel XE#4208]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         [SKIP][322] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][323] ([Intel XE#4996])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#4208]) -> [SKIP][325] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][327] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208]) -> [SKIP][329] ([Intel XE#2907]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#4208] / [i915#2575]) -> [SKIP][331] ([Intel XE#373]) +5 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#306]) -> [SKIP][333] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-adlp:         [SKIP][334] ([Intel XE#373]) -> [SKIP][335] ([Intel XE#4996])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][336] ([Intel XE#373]) -> [SKIP][337] ([Intel XE#4950] / [Intel XE#4996])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#373]) -> [SKIP][339] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#4208] / [i915#2575]) -> [SKIP][341] ([Intel XE#307])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][342] ([Intel XE#2341]) -> [FAIL][343] ([Intel XE#1178])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_content_protection@legacy.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][344] ([Intel XE#1178]) -> [SKIP][345] ([Intel XE#2341]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_content_protection@srm.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][346] ([Intel XE#1188]) -> [SKIP][347] ([Intel XE#4208] / [i915#2575])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_content_protection@uevent.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][348] ([Intel XE#1188]) -> [SKIP][349] ([Intel XE#2341])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_content_protection@uevent.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#308]) -> [SKIP][351] ([Intel XE#4208] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         [SKIP][352] ([Intel XE#309]) -> [SKIP][353] ([Intel XE#4996])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][355] ([Intel XE#455])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-adlp:         [SKIP][356] ([Intel XE#455]) -> [SKIP][357] ([Intel XE#2351] / [Intel XE#4996])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_dsc@dsc-with-formats.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208] / [i915#2575]) -> [SKIP][359] ([Intel XE#703])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1138]) -> [SKIP][361] ([Intel XE#4208] / [i915#2575])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [SKIP][362] ([Intel XE#310]) -> [SKIP][363] ([Intel XE#4996]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][364] ([Intel XE#2316]) -> [FAIL][365] ([Intel XE#3321])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [FAIL][366] ([Intel XE#2882]) -> [SKIP][367] ([Intel XE#4996])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#4208] / [i915#2575]) -> [FAIL][369] ([Intel XE#301])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][370] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][371] ([Intel XE#4208] / [i915#2575])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][373] ([Intel XE#2049] / [Intel XE#2597])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][374] ([Intel XE#455]) -> [SKIP][375] ([Intel XE#2351])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#455]) -> [SKIP][377] ([Intel XE#4208]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#455]) -> [SKIP][379] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#4208]) -> [SKIP][381] ([Intel XE#651]) +9 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][382] ([Intel XE#651]) -> [SKIP][383] ([Intel XE#4996])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][384] ([Intel XE#2312]) -> [SKIP][385] ([Intel XE#2311]) +30 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#651]) -> [SKIP][387] ([Intel XE#4208]) +14 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][388] ([Intel XE#2311]) -> [SKIP][389] ([Intel XE#2312]) +21 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][390] ([Intel XE#2312]) -> [SKIP][391] ([Intel XE#4141]) +12 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][392] ([Intel XE#656]) -> [SKIP][393] ([Intel XE#4947]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][394] ([Intel XE#4141]) -> [SKIP][395] ([Intel XE#2312]) +10 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#651]) -> [SKIP][397] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][399] ([Intel XE#651]) +9 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#653]) -> [SKIP][401] ([Intel XE#4208]) +12 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][402] ([Intel XE#2312]) -> [SKIP][403] ([Intel XE#2313]) +26 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][405] ([Intel XE#653]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#658]) -> [SKIP][407] ([Intel XE#2351] / [Intel XE#4208])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#4208]) -> [SKIP][409] ([Intel XE#455]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#653]) -> [SKIP][411] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][412] ([Intel XE#2313]) -> [SKIP][413] ([Intel XE#2312]) +25 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][414] ([Intel XE#653]) -> [SKIP][415] ([Intel XE#4947])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#4208]) -> [SKIP][417] ([Intel XE#653]) +15 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#4208] / [i915#2575]) -> [SKIP][419] ([Intel XE#455]) +5 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-adlp:         [SKIP][420] ([Intel XE#455]) -> [SKIP][421] ([Intel XE#4950]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_hdr@static-toggle.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2925]) -> [SKIP][423] ([Intel XE#4208])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#2927]) -> [SKIP][425] ([Intel XE#4208]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#356]) -> [SKIP][427] ([Intel XE#4208] / [i915#2575])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][428] ([Intel XE#5021]) -> [SKIP][429] ([Intel XE#4596])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][431] ([Intel XE#4208] / [i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#4208] / [i915#2575]) -> [SKIP][433] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][435] ([Intel XE#908])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][437] ([Intel XE#1129])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#908]) -> [SKIP][439] ([Intel XE#4208])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#4208]) -> [SKIP][441] ([Intel XE#1489]) +6 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1489]) -> [SKIP][443] ([Intel XE#4208]) +6 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#1122]) -> [SKIP][445] ([Intel XE#4208])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][446] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][447] ([Intel XE#4996])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][449] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#4208]) -> [SKIP][451] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][453] ([Intel XE#4208]) +6 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][455] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1127]) -> [SKIP][457] ([Intel XE#4208] / [i915#2575])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#3414]) -> [SKIP][459] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#455]) -> [SKIP][461] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         [SKIP][462] ([Intel XE#455]) -> [SKIP][463] ([Intel XE#4996]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#756]) -> [SKIP][465] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#4208] / [i915#2575]) -> [SKIP][467] ([Intel XE#1091] / [Intel XE#2849])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1123]) -> [SKIP][469] ([Intel XE#4208]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#4208]) -> [SKIP][471] ([Intel XE#1123])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#4497]) -> [SKIP][473] ([Intel XE#4208]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-adlp:         [SKIP][474] ([Intel XE#4837]) -> [SKIP][475] ([Intel XE#4945]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#4208]) -> [SKIP][477] ([Intel XE#4518])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][478] ([Intel XE#1392]) -> [SKIP][479] ([Intel XE#4945]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#4208]) -> [SKIP][481] ([Intel XE#1392]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-adlp:         [SKIP][482] ([Intel XE#288]) -> [SKIP][483] ([Intel XE#4945]) +4 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#288]) -> [SKIP][485] ([Intel XE#4208]) +16 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#4208]) -> [SKIP][487] ([Intel XE#288]) +16 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#2360]) -> [SKIP][489] ([Intel XE#4208]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][490] ([Intel XE#3868]) -> [SKIP][491] ([Intel XE#4945])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec_reset@cat-error.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#4208]) -> [SKIP][493] ([Intel XE#4837]) +8 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#4837]) -> [SKIP][495] ([Intel XE#4208]) +9 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:
    - shard-adlp:         [SKIP][496] ([Intel XE#4915]) -> [SKIP][497] ([Intel XE#4945] / [Intel XE#4996]) +35 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#4208]) -> [SKIP][499] ([Intel XE#4915]) +105 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#4915]) -> [SKIP][501] ([Intel XE#4208]) +118 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#4501]) -> [SKIP][503] ([Intel XE#4208])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_oa@buffer-size.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][505] ([Intel XE#4208]) +3 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_oa@mi-rpc.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#4208]) -> [SKIP][507] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_oa@missing-sample-flags.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][509] ([Intel XE#4208])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_oa@syncs-syncobj-none.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         [SKIP][510] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][511] ([Intel XE#4945])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#4208]) -> [SKIP][513] ([Intel XE#977])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][515] ([Intel XE#1173])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_peer2peer@write.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#4208]) -> [SKIP][517] ([Intel XE#2284] / [Intel XE#366])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][519] ([Intel XE#4208]) +1 other test skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#4208]) -> [SKIP][521] ([Intel XE#4650])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#4208]) -> [SKIP][523] ([Intel XE#4733]) +2 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#4733]) -> [SKIP][525] ([Intel XE#4208]) +1 other test skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         [SKIP][526] ([Intel XE#944]) -> [SKIP][527] ([Intel XE#4945])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_query@multigpu-query-mem-usage.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#944]) -> [SKIP][529] ([Intel XE#4208]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#4208]) -> [SKIP][531] ([Intel XE#944]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_query@multigpu-query-pxp-status.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#4208]) -> [SKIP][533] ([Intel XE#3342])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#3342]) -> [SKIP][535] ([Intel XE#4208])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4979
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3085-84da78f30dc4c78f6c328ed142db458457035da0 -> xe-pw-148957v1

  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3085-84da78f30dc4c78f6c328ed142db458457035da0: 84da78f30dc4c78f6c328ed142db458457035da0
  xe-pw-148957v1: 148957v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/index.html

--===============0312741322078868740==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add no_psr_reason to PSR d=
ebugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148957/">https://patchwork.freedesktop.org/series/148957/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148957v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148957v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3085-84da78f30dc4c78f6c328ed142db45845=
7035da0_FULL -&gt; xe-pw-148957v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148957v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148957v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1489=
57v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-7/igt@kms_curs=
or_crc@cursor-random-128x128@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-8/igt@kms=
_cursor_crc@cursor-random-128x128@pipe-c-edp-1.html">INCOMPLETE</a> +1 othe=
r test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-1/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148957v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.h=
tml">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_seq=
uence@get-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_sequence@get-busy.html">S=
KIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-9/igt@xe_exec=
_reset@virtual-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-1/igt@xe_exec_reset@virtua=
l-gt-reset.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-mmap-mlock.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_ex=
ec_system_allocator@many-stride-mmap-mlock.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nomemset:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-execqueues-new-busy-nomemset.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sh=
ard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-new-busy-nom=
emset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148957v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sha=
rd-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr=
2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2=
/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr=
2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr=
@psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/i=
gt@kms_psr@psr2-sprite-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_tv_=
load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_vrr=
@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_vrr@flip-basic.h=
tml">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148957v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@fbdev@=
unaligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@fbdev@unaligned-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_asy=
nc_flips@invalid-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-6/igt@kms_async_flips@=
invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big=
_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_=
big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +12=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_cursor_c=
rc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +56 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +12 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-1/igt@kms_fli=
p@flip-vs-panning.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148957v1/shard-adlp-9/igt@kms_flip@flip-vs-panning.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-8/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-in=
terruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recrea=
te-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_force_connector_basic@for=
ce-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
-shrfb-scaledprimary.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_joiner@basic-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3012">Intel XE#3012</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_pro=
p_blob@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_prop_blob@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">I=
ntel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr2_sf@pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr@fbc-psr2-basic@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_psr@psr2-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@kms_setmode@basic-clone-sing=
le-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@kms_vbla=
nk@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_vblank@ts=
-continuation-dpms-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4979">Intel XE#4979</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-=
not-in-debug-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_evict@evict-small-cm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_bal=
ancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +124 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-ex=
ec-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-free:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec=
_compute_mode@once-userptr-free.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec_comp=
ute_mode@once-userptr-free.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoi=
nt-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_exec_system_allocator@man=
y-mmap-file.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-=
nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db45845703=
5da0/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db4584=
57035da0/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db=
458457035da0/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed1=
42db458457035da0/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c32=
8ed142db458457035da0/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f=
6c328ed142db458457035da0/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4=
c78f6c328ed142db458457035da0/shard-bmg-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da78f3=
0dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-84da=
78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3085-=
84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_noexec_ping_pong.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"=
>Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_oa@syncs-ufence-wait-cfg.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-1/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148957v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pxp@pxp-stale-queue-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-many-all.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe=
_vm@munmap-style-unbind-userptr-inval-many-all.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@core_s=
etmaster@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt=
@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@intel_=
sysfs_debugfs@xe-base.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-4=
35/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148957v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">In=
tel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148957v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-m=
c-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +7 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-8/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-2/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg=
-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +8 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sha=
rd-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-3/igt@k=
ms_flip@flip-vs-expired-vblank@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1=
/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-upscaling.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-not-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_get=
fb@getfb-handle-not-fb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-6/igt@k=
ms_getfb@getfb-handle-not-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_le=
ase@invalid-create-leases.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-435/igt@kms_lease@invalid-create-leases.html">PASS</a> +48 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-8/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-7/igt@kms_vrr@flipline.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-lnl-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-lnl-1/igt@xe_pm@s4-d3h=
ot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-9/igt@xe_pm@s=
4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-4/igt@xe_pm@s4-exec-af=
ter.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_vm@=
invalid-extensions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_vm@inva=
lid-extensions.html">PASS</a> +118 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@k=
ms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@km=
s_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big=
_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_bi=
g_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@k=
ms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sha=
rd-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big=
_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms=
_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@km=
s_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/=
igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v=
1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148957v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-46=
4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_bw@=
linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard=
-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_cc=
s@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464=
/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_ccs=
@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14895=
7v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/s=
hard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-=
432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ch=
amelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@=
kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_cha=
melium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-a=
dlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_cha=
melium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/i=
gt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel X=
E#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-=
464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sh=
ard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-4/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_c=
ontent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@=
kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ds=
c@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/sha=
rd-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_dsc=
@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-=
dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@km=
s_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp=
-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-=
bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shar=
d-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">In=
tel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-435/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg=
2-464/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/=
shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yft=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14895=
7v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb10=
1010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148957v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/=
igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shar=
d-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/=
igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_hdr=
@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_hdr@static-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg=
2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-fac=
tor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@km=
s_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-4=
35/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ps=
r2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_psr=
@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adl=
p-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ps=
r@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@kms_p=
sr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard=
-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2=
-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg=
2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@kms_sc=
aling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-46=
4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@kms_set=
mode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@kms_wri=
teback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_cop=
y_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt=
@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_eude=
bug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1=
/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_eud=
ebug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_eu=
debug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8957v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-i=
nvalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-a=
dlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2=
-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/=
shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec=
_reset@cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_exec=
_reset@cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432=
/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-d=
g2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_exec=
_system_allocator@many-large-execqueues-malloc-bo-unmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#=
4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148957v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-ma=
lloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +35 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-many-malloc-bo-unmap-nomemset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148957v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-malloc-bo=
-unmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-435/igt@xe_oa@=
mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_oa@mi=
-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_oa@mi=
ssing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_oa@=
syncs-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/=
shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_oa@s=
yncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe_pat@pat-ind=
ex-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435/igt@xe=
_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pmu=
@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-435=
/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-433/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-=
dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-adlp-2/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-adlp-2/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_q=
uery@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_que=
ry@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@=
xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-464/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-432/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3085-84da78f30dc4c78f6c328ed142db458457035da0/shard-dg2-463/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v1/shard-dg2-464/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3085-84da78f30dc4c78f6c328ed142db458457035da0 -&gt; xe-pw-148=
957v1</li>
</ul>
<p>IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3085-84da78f30dc4c78f6c328ed142db458457035da0: 84da78f30dc4c78f6c328ed=
142db458457035da0<br />
  xe-pw-148957v1: 148957v1</p>

</body>
</html>

--===============0312741322078868740==--
