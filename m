Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBDDCD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 21:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D85112F97;
	Tue,  9 Apr 2024 21:54:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB06112F95;
 Tue,  9 Apr 2024 21:54:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1518138074249551038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Support/debug_for_slow_GuC_load?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 21:54:46 -0000
Message-ID: <171269968657.1307454.2489871185304022628@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
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

--===============1518138074249551038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support/debug for slow GuC loads
URL   : https://patchwork.freedesktop.org/series/132227/
State : failure

== Summary ==

CI Bug Log - changes from xe-1063-7be27f645de2f00384b862d2812a90675e8392fa_full -> xe-pw-132227v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132227v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132227v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132227v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@bind-flag-invalid:
    - shard-adlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][2] ([Intel XE#1178]) -> [ABORT][3] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-132227v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][4] ([Intel XE#1538])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][5] ([Intel XE#1538])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#1201] / [i915#6077]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-32.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#660])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [PASS][9] -> [SKIP][10] ([Intel XE#1201]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#827]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
    - shard-adlp:         [PASS][17] -> [SKIP][18] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#829])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][21] ([Intel XE#1231])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#616]) +2 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1204])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1231])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#619])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#607])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#787]) +79 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#1252])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#373]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#307])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1188]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-dg2-set2:     [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#1201]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#1214]) +1 other test dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#1191] / [Intel XE#1214])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][59] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) +1 other test dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214] / [i915#10142]) +2 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][61] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][63] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][65] -> [FAIL][66] ([Intel XE#616]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#656]) +36 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1158] / [Intel XE#1201])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#1339])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1214] / [i915#10142])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#361])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1122] / [Intel XE#1201])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#908])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1211])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [PASS][87] -> [SKIP][88] ([Intel XE#1201] / [Intel XE#1211]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201]) +16 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1149] / [Intel XE#1201])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1127] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#327])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sequence@queue-busy:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#1201] / [Intel XE#1234])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_sequence@queue-busy.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_sequence@queue-busy.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][98] ([Intel XE#1174])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#869])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#771] / [Intel XE#899])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][102] -> [FAIL][103] ([Intel XE#899]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-adlp:         NOTRUN -> [FAIL][105] ([Intel XE#1080]) +9 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1126] / [Intel XE#1201])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][108] ([Intel XE#1206] / [Intel XE#1259] / [Intel XE#1473])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html
    - shard-dg2-set2:     [PASS][110] -> [TIMEOUT][111] ([Intel XE#1473] / [Intel XE#392])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1473])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_evict@evict-small.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:
    - shard-adlp:         [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1195])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][117] -> [ABORT][118] ([Intel XE#1304]) +1 other test abort
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#1329])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_store@cachelines:
    - shard-dg2-set2:     [PASS][122] -> [FAIL][123] ([Intel XE#1270])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@xe_exec_store@cachelines.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_exec_store@cachelines.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][124] -> [TIMEOUT][125] ([Intel XE#1261] / [Intel XE#1356] / [Intel XE#402])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][126] -> [INCOMPLETE][127] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +1 other test incomplete
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][128] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-adlp:         [PASS][129] -> [DMESG-WARN][130] ([Intel XE#1214])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@xe_gt_freq@freq_reset_multiple.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-adlp:         [PASS][131] -> [SKIP][132] ([Intel XE#1192] / [Intel XE#1201])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@xe_live_ktest@xe_migrate.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#378])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#979])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1061] / [Intel XE#1201])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_query@multigpu-query-hwconfig.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [ABORT][137] ([Intel XE#1088]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [DMESG-WARN][139] ([Intel XE#1214]) -> [PASS][140] +4 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][141] ([Intel XE#1231]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-adlp:         [FAIL][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][145] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-adlp:         [SKIP][147] ([Intel XE#1201]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_dp_aux_dev.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_dp_aux_dev.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#1214]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][155] ([Intel XE#616]) -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [INCOMPLETE][157] ([Intel XE#1195]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#417]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-adlp:         [INCOMPLETE][161] ([Intel XE#1150] / [Intel XE#1195]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#361]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-adlp:         [SKIP][167] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_pm_rpm@system-suspend-modeset.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@wait-forked-hang:
    - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1195] / [Intel XE#1330]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_vblank@wait-forked-hang.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_vblank@wait-forked-hang.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [ABORT][171] ([Intel XE#1304]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][173] ([Intel XE#821]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_compute_mode@many-bindexecqueue:
    - shard-dg2-set2:     [ABORT][175] ([Intel XE#1304] / [Intel XE#1364]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@xe_exec_compute_mode@many-bindexecqueue.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_exec_compute_mode@many-bindexecqueue.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [TIMEOUT][177] ([Intel XE#1261] / [Intel XE#1356]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#1256]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_intel_bb@intel-bb-blit-none:
    - shard-adlp:         [DMESG-FAIL][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@xe_intel_bb@intel-bb-blit-none.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_intel_bb@intel-bb-blit-none.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [FAIL][183] ([Intel XE#355]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_pm@d3hot-basic.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [INCOMPLETE][185] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@xe_pm@s3-basic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [DMESG-WARN][192] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][194] ([Intel XE#1033] / [Intel XE#1214]) +2 other tests dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][195] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][197] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#829])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [SKIP][201] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][202] ([Intel XE#1124] / [Intel XE#1201])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         [SKIP][203] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][204] ([Intel XE#1201])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][206] ([Intel XE#1201]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#829])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][209] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][211] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#829])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][213] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#829])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#829])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][218] ([Intel XE#1178])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_content_protection@legacy.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-adlp:         [SKIP][219] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#1201]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_content_protection@mei-interface.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-adlp:         [SKIP][221] ([Intel XE#1201]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][223] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][224] ([Intel XE#1195] / [Intel XE#927])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][226] ([Intel XE#1195])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][228] ([Intel XE#1214] / [Intel XE#282])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-dg2-set2:     [DMESG-WARN][229] ([Intel XE#1088] / [Intel XE#1214]) -> [SKIP][230] ([Intel XE#1201])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][232] ([Intel XE#1201]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [SKIP][233] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][234] ([Intel XE#1201]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][235] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [SKIP][236] ([Intel XE#1201])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#1162] / [Intel XE#1214]) -> [SKIP][238] ([Intel XE#1201])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-adlp:         [SKIP][239] ([Intel XE#1201]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#651])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][242] ([Intel XE#1201]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][243] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#656])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][245] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][246] ([Intel XE#1201]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         [SKIP][247] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][248] ([Intel XE#1201]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][249] ([Intel XE#1201]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#656])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][251] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][252] ([Intel XE#1201])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][254] ([Intel XE#1201]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][255] ([Intel XE#616]) -> [DMESG-FAIL][256] ([Intel XE#1162]) +3 other tests dmesg-fail
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][257] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][258] ([Intel XE#324])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][259] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][260] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][261] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][262] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         [SKIP][263] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][264] ([Intel XE#1201])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][266] ([Intel XE#1201])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][267] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#836])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][270] ([Intel XE#1201]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-adlp:         [SKIP][271] ([Intel XE#1201]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-adlp:         [SKIP][273] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][274] ([Intel XE#1201]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_psr@psr-sprite-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][275] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][276] ([Intel XE#1191] / [Intel XE#1214])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][277] ([Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][278] ([Intel XE#1191] / [Intel XE#1214])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [INCOMPLETE][279] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][280] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][281] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][282] ([Intel XE#1191] / [Intel XE#1214])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [DMESG-FAIL][283] ([Intel XE#482]) -> [INCOMPLETE][284] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][285] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][286] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [INCOMPLETE][287] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][288] ([Intel XE#1214] / [i915#10142])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][290] ([Intel XE#1162])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7802 -> IGT_7803
  * Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -> xe-pw-132227v1

  IGT_7802: 7802
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa
  xe-pw-132227v1: 132227v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/index.html

--===============1518138074249551038==
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
<tr><td><b>Series:</b></td><td>Support/debug for slow GuC loads</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132227/">https://patchwork.freedesktop.org/series/132227/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1063-7be27f645de2f00384b862d2812a90675e8392fa_full -&gt; xe-pw-132227v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132227v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132227v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132227v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@bind-flag-invalid:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic-dpms:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132227v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@core_hotunplug@hotreplug.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane_multiple@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_sequence@queue-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_sequence@queue-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080">Intel XE#1080</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@cachelines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@xe_exec_store@cachelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_exec_store@cachelines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270">Intel XE#1270</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-64x64.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-64x64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@kms_vblank@wait-forked-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_vblank@wait-forked-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@xe_exec_compute_mode@many-bindexecqueue.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364">Intel XE#1364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_exec_compute_mode@many-bindexecqueue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-463/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-none:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-4/igt@xe_intel_bb@intel-bb-blit-none.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@xe_intel_bb@intel-bb-blit-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-433/igt@xe_pm@d3hot-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@xe_pm@d3hot-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@xe_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-434/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-8/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10142">i915#10142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1063-7be27f645de2f00384b862d2812a90675e8392fa/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132227v1/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7802 -&gt; IGT_7803</li>
<li>Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -&gt; xe-pw-132227v1</li>
</ul>
<p>IGT_7802: 7802<br />
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa<br />
  xe-pw-132227v1: 132227v1</p>

</body>
</html>

--===============1518138074249551038==--
