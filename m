Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABDE7719A
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jan 2025 22:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864DF10E1B8;
	Sat, 11 Jan 2025 22:27:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421F510E186;
 Sat, 11 Jan 2025 22:27:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7807417708475886877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Use_exec_que?=
 =?utf-8?q?ue_hints_for_GT_frequency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Jan 2025 22:27:49 -0000
Message-ID: <173663446925.2638304.11910386219853809049@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
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

--===============7807417708475886877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Use exec queue hints for GT frequency (rev2)
URL   : https://patchwork.freedesktop.org/series/143323/
State : failure

== Summary ==

CI Bug Log - changes from xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b_full -> xe-pw-143323v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143323v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143323v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143323v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [INCOMPLETE][9] ([Intel XE#1473]) -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html

  
New tests
---------

  New tests have been introduced between xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b_full and xe-pw-143323v2_full:

### New IGT tests (1) ###

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  

Known issues
------------

  Here are the changes found in xe-pw-143323v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#1033]) +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#3908]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1467])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2191])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1512])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#3862]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +76 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2887])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2321])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#308])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#309]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#1475])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#2141])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([i915#3804])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1138])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1135])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#3288] / [Intel XE#3321]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#2882]) +2 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#3321]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2316]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#2882])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#301]) +5 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#2882])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293] / [Intel XE#2380])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#455]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#455]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401] / [Intel XE#1745])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#352])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#651])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#651]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#656])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2311]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#651]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#2333]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#653]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2313]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#656]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#455])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#3012])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2927])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#2953]) +4 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#361])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2938])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][95] -> [FAIL][96] ([Intel XE#718])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1489])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#3414] / [Intel XE#3904])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3414])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1435]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#1435])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#899])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#2159]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1499])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1091] / [Intel XE#2849])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2905]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#3889])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2905]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#261] / [Intel XE#688])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][116] -> [TIMEOUT][117] ([Intel XE#1473])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1392]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2322]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1392]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#288]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][123] -> [SKIP][124] ([Intel XE#1192])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1008])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_mmap@vram.html

  * igt@xe_oa@non-zero-reason:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@stress-open-close:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2541] / [Intel XE#3573])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_oa@stress-open-close.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][128] ([Intel XE#2953])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
    - shard-dg2-set2:     [PASS][129] -> [ABORT][130] ([Intel XE#1358])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][131] -> [ABORT][132] ([Intel XE#1358] / [Intel XE#1794])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_pm@s3-mocs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#584])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][134] -> [ABORT][135] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1794])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][138] -> [ABORT][139] ([Intel XE#2625]) +1 other test abort
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#944])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-bmg:          [INCOMPLETE][142] -> [PASS][143] +3 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-5/igt@kms_atomic_interruptible@legacy-cursor.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#1033]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#1033]) -> [PASS][147] +3 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][148] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][150] ([Intel XE#3862]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][154] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][156] ([Intel XE#2291]) -> [PASS][157] +5 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][158] ([Intel XE#877]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#3226]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][162] ([Intel XE#1475]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][164] ([Intel XE#2316]) -> [PASS][165] +7 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#3321]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][168] ([Intel XE#301]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [FAIL][170] ([Intel XE#2882]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][174] ([Intel XE#1503]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [INCOMPLETE][176] ([Intel XE#1616]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#361]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][180] ([Intel XE#1435]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension:
    - shard-dg2-set2:     [INCOMPLETE][182] -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [DMESG-WARN][184] ([Intel XE#2953]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][186] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][188] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#1727]) -> [INCOMPLETE][191] ([Intel XE#1727] / [Intel XE#3124])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][192] ([Intel XE#2341]) -> [FAIL][193] ([Intel XE#1178]) +1 other test fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_content_protection@srm.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][194] ([Intel XE#877]) -> [SKIP][195] ([Intel XE#2291])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][196] ([Intel XE#2316]) -> [FAIL][197] ([Intel XE#2882])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][198] ([Intel XE#2311]) -> [SKIP][199] ([Intel XE#2312]) +11 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][200] ([Intel XE#2333]) -> [SKIP][201] ([Intel XE#2312]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [FAIL][203] ([Intel XE#2333]) +5 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#2311]) +14 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#2313]) -> [SKIP][207] ([Intel XE#2312]) +13 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][208] ([Intel XE#2312]) -> [SKIP][209] ([Intel XE#2313]) +13 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][210] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][211] ([Intel XE#3544])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1500]) -> [SKIP][213] ([Intel XE#362])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][214] ([Intel XE#1473]) -> [INCOMPLETE][215] ([Intel XE#1473]) +1 other test incomplete
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [INCOMPLETE][216] ([Intel XE#1473]) -> [TIMEOUT][217] ([Intel XE#1473])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][218] ([Intel XE#1473]) -> [TIMEOUT][219] ([Intel XE#1473] / [Intel XE#2472])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][220] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][221] ([Intel XE#1000])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][222] ([Intel XE#1473] / [Intel XE#2472]) -> [INCOMPLETE][223] ([Intel XE#1473])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-threads-large.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][224] ([Intel XE#1192]) -> [SKIP][225] ([Intel XE#2833])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b -> xe-pw-143323v2

  IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b: 14e0c4a8247c9514dc57b2231602fb6d9455802b
  xe-pw-143323v2: 143323v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/index.html

--===============7807417708475886877==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Use exec queue hints for GT frequency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143323/">https://patchwork.freedesktop.org/series/143323/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b_full -&gt; xe-pw-143323v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143323v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143323v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143323v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-6.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-large:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b_full and xe-pw-143323v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143323v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_oa@non-zero-reason.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_oa@stress-open-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@xe_pm@s3-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-5/igt@kms_atomic_interruptible@legacy-cursor.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-433/igt@xe_exercise_blt@fast-copy-inc-dimension.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-8/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-6/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143323v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b -&gt; xe-pw-143323v2</li>
</ul>
<p>IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b: 14e0c4a8247c9514dc57b2231602fb6d9455802b<br />
  xe-pw-143323v2: 143323v2</p>

</body>
</html>

--===============7807417708475886877==--
