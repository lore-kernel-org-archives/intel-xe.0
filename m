Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDEC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 22:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667D10E2CD;
	Mon,  5 Aug 2024 22:04:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408BF10E2CD;
 Mon,  5 Aug 2024 22:04:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2668140116718851361=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_Only_check_last_fence?=
 =?utf-8?q?_on_user_binds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 22:04:57 -0000
Message-ID: <172289549724.541922.14594626356322497947@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805200233.3050325-1-matthew.brost@intel.com>
In-Reply-To: <20240805200233.3050325-1-matthew.brost@intel.com>
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

--===============2668140116718851361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Only check last fence on user binds
URL   : https://patchwork.freedesktop.org/series/136898/
State : success

== Summary ==

CI Bug Log - changes from xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de_full -> xe-pw-136898v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136898v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2:
    - {shard-bmg}:        [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - {shard-bmg}:        NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * {igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3}:
    - {shard-bmg}:        [PASS][4] -> [DMESG-WARN][5] +15 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - {shard-bmg}:        [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - {shard-bmg}:        NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-136898v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1465])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_3d.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1659])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#316])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1874])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1477]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1428])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +13 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1252])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1399]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#1252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#373])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#373]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#1178]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#309])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#323])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#323])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [PASS][53] -> [DMESG-WARN][54] ([Intel XE#877]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#702])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1137])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][57] ([Intel XE#2019]) +3 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#886])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397] / [Intel XE#1745])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#651]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#651]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#653]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#656]) +9 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#2028]) +5 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1151] / [Intel XE#1201])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][76] ([Intel XE#1195])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#1201] / [Intel XE#455])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][80] -> [DMESG-WARN][81] ([Intel XE#2019])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#324]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#599]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#455]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2318]) +11 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#870])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1122])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1439])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1489])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1122] / [Intel XE#1201])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1406]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#929]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#327])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1437])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1127])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#327])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#327])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#330])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#756])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#756])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1126] / [Intel XE#1201])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#688]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html
    - shard-dg2-set2:     [PASS][114] -> [TIMEOUT][115] ([Intel XE#1473] / [Intel XE#392])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#688])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1392]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#288]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][122] -> [DMESG-WARN][123] ([Intel XE#1620])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#584])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][125] -> [TIMEOUT][126] ([Intel XE#2026])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@xe_module_load@many-reload.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#2207])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2207])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_oa@oa-exponents:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#2207])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_oa@oa-exponents.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#977])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#979])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#2284])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1794])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][135] -> [ABORT][136] ([Intel XE#1794]) +1 other test abort
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#944])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [DMESG-WARN][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][141] ([Intel XE#1033]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#1426]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][145] ([Intel XE#1426]) -> [PASS][146] +3 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [FAIL][147] ([Intel XE#2436]) -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [INCOMPLETE][149] ([Intel XE#1195]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#877]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_flip@2x-flip-vs-panning:
    - {shard-bmg}:        [DMESG-WARN][153] ([Intel XE#877]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][155] -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * {igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3}:
    - {shard-bmg}:        [INCOMPLETE][157] -> [PASS][158] +5 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][159] ([Intel XE#886]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][161] ([Intel XE#1503]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][163] ([Intel XE#1162]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          [INCOMPLETE][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][167] ([Intel XE#771] / [Intel XE#899]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#771] / [Intel XE#899]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#899]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][173] ([Intel XE#899]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][175] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - {shard-bmg}:        [DMESG-WARN][181] -> [PASS][182] +5 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [FAIL][183] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-lnl:          [INCOMPLETE][185] ([Intel XE#1616]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-userptr.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][187] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][189] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][191] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][193] ([Intel XE#958]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#316]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][198] ([Intel XE#316]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][199] ([Intel XE#324]) -> [FAIL][200] ([Intel XE#1231])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][201] ([Intel XE#1231]) -> [DMESG-FAIL][202] ([Intel XE#324]) +1 other test dmesg-fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][204] ([Intel XE#1124]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#610]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#610])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1124]) -> [SKIP][208] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][210] ([Intel XE#346])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][212] ([Intel XE#367]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#367]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][216] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#787]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1252]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#1252])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][222] ([Intel XE#787]) +62 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][226] ([Intel XE#314]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#306]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][230] ([Intel XE#306]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_chamelium_color@gamma.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#373]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][234] ([Intel XE#373]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][236] ([Intel XE#307])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][238] ([Intel XE#308])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#455]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][242] ([Intel XE#455]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#323]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#323])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][246] ([Intel XE#323])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][248] ([Intel XE#776])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][250] ([Intel XE#701])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][252] ([Intel XE#651]) +23 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#651]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#658]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#658]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#653]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][260] ([Intel XE#653]) +22 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][262] ([Intel XE#417])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#356]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#356])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][266] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][268] ([Intel XE#2318]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][270] ([Intel XE#870])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][272] ([Intel XE#1129]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#908]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#908])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][275] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][276] ([Intel XE#1204])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][278] ([Intel XE#1489])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1489]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][282] ([Intel XE#1122]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][284] ([Intel XE#929]) +8 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#929]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][288] ([Intel XE#327]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#327]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#327])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][292] ([Intel XE#2168])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_vrr@cmrr.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#756]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#756])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][296] ([Intel XE#1123])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [FAIL][297] ([Intel XE#1000]) -> [INCOMPLETE][298] ([Intel XE#1195] / [Intel XE#1473])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][299] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][300] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#288]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][304] ([Intel XE#288]) +19 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#255]) -> [SKIP][306] ([Intel XE#1201] / [Intel XE#255])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#560]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#560])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2207]) -> [SKIP][310] ([Intel XE#1201] / [Intel XE#2207]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201] / [Intel XE#2207]) -> [SKIP][312] ([Intel XE#2207]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_oa@polling-small-buf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#979]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#979])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][316] ([Intel XE#2284] / [Intel XE#366])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][318] ([Intel XE#579])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][320] ([Intel XE#944]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#944]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de -> xe-pw-136898v1

  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de: 23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de
  xe-pw-136898v1: 136898v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/index.html

--===============2668140116718851361==
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
<tr><td><b>Series:</b></td><td>drm/xe: Only check last fence on user binds</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136898/">https://patchwork.freedesktop.org/series/136898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de_full -&gt; xe-pw-136898v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136898v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-3/igt@kms_display_modes@extended-mode-basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html">DMESG-WARN</a> +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136898v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-8/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_oa@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_flip@2x-flip-vs-panning-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3}:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207">Intel XE#2207</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136898v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de -&gt; xe-pw-136898v1</li>
</ul>
<p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1717-23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de: 23ec1faf2266dcf876eec794bbd6ccdfb8c3c0de<br />
  xe-pw-136898v1: 136898v1</p>

</body>
</html>

--===============2668140116718851361==--
