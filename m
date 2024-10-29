Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0542D2AB3C
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 13:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCC610E05E;
	Tue, 29 Oct 2024 13:22:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF3F10E05E;
 Tue, 29 Oct 2024 13:22:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1050266288112646719=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_bunch_of_st?=
 =?utf-8?q?ruct_intel=5Fdisplay_conversions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 13:22:15 -0000
Message-ID: <173020813509.1359386.7090457628751143636@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1729776384.git.jani.nikula@intel.com>
In-Reply-To: <cover.1729776384.git.jani.nikula@intel.com>
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

--===============1050266288112646719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: bunch of struct intel_display conversions (rev2)
URL   : https://patchwork.freedesktop.org/series/140323/
State : failure

== Summary ==

CI Bug Log - changes from xe-2123-526c63710d1e43d3bf56ed9260f69412533de182_full -> xe-pw-140323v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140323v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140323v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140323v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@xe_exec_compute_mode@many-userptr-unmap:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-unmap.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-unmap.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access.html

  
#### Warnings ####

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][8] ([Intel XE#1473]) -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  
Known issues
------------

  Here are the changes found in xe-pw-140323v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] ([Intel XE#2910])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@core_hotunplug@hotrebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@core_hotunplug@hotrebind.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#827]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#1033] / [Intel XE#1727])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][16] ([Intel XE#3194]) +3 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#877])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][25] ([Intel XE#1874]) +8 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#2907])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +26 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#3113])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195] / [Intel XE#1727])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3113])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#373]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-lnl:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#2929]) +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@kms_color@ctm-0-25@pipe-c-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#307])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#307])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-lnl:          [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1616]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#323])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#877])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#309])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#1475])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#323])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#323])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#776])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#310]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#301])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#301])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#886]) +5 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#455]) +20 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#651]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#651]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#656]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1151])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#653]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#653]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#656]) +21 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1341])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1503])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#309]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2007])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1489]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1489]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1122])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff@edp-1:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#2808]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_psr@psr-cursor-plane-onoff@edp-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_psr@psr-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#2948]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#327]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#327])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_sequence@queue-idle@pipe-b-edp-1:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#2467]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@kms_sequence@queue-idle@pipe-b-edp-1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_sequence@queue-idle@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#899])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#756])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1123])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#2667])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2905]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2905]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2905]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#688])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1392]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1392]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#288]) +14 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#288]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-rebind.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-dg2-set2:     [PASS][117] -> [DMESG-WARN][118] ([Intel XE#358])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][119] ([Intel XE#1962])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [PASS][120] -> [DMESG-WARN][121] ([Intel XE#3230]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-6/igt@xe_exec_threads@threads-cm-userptr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][122] ([Intel XE#358])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-bmg:          [PASS][123] -> [DMESG-WARN][124] ([Intel XE#3230]) +3 other tests dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [PASS][125] -> [SKIP][126] ([Intel XE#1192])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@xe_live_ktest@xe_bo.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][127] ([Intel XE#2961] / [Intel XE#3191])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2541]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2541]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2838] / [Intel XE#979])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1948])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][132] -> [ABORT][133] ([Intel XE#1358] / [Intel XE#1607])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][134] -> [ABORT][135] ([Intel XE#1607] / [Intel XE#1794])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#944])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#944]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
    - shard-lnl:          [PASS][139] -> [DMESG-WARN][140] ([Intel XE#3230])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-dg2-set2:     [PASS][141] -> [DMESG-WARN][142] ([Intel XE#3230]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][143] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-adlp:         [FAIL][147] ([Intel XE#1475]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#301]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][151] ([Intel XE#301]) -> [PASS][152] +3 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][153] ([Intel XE#2882]) -> [PASS][154] +4 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1195] / [Intel XE#2597]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][159] ([Intel XE#886]) -> [PASS][160] +7 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][161] ([Intel XE#1874]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][163] ([Intel XE#1430]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [DMESG-WARN][165] ([Intel XE#2932]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-lnl:          [DMESG-WARN][167] ([Intel XE#3184]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][169] ([Intel XE#2042]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][171] ([Intel XE#2948]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][173] ([Intel XE#899]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][175] ([Intel XE#2159]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [FAIL][177] ([Intel XE#2667]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [DMESG-FAIL][179] ([Intel XE#3230]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][181] ([Intel XE#1000]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [FAIL][183] ([Intel XE#1000]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
    - shard-dg2-set2:     [INCOMPLETE][185] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][187] ([Intel XE#2364]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [DMESG-WARN][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@no-exec-null-defer-bind:
    - shard-lnl:          [DMESG-WARN][191] -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@xe_exec_basic@no-exec-null-defer-bind.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-7/igt@xe_exec_basic@no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [DMESG-WARN][193] ([Intel XE#3230]) -> [PASS][194] +3 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][195] ([Intel XE#3230]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#3230]) -> [PASS][198] +2 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#3230]) -> [PASS][200] +4 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][201] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][203] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][205] ([Intel XE#1794]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][207] ([Intel XE#958]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@compact-64k-pages:
    - shard-adlp:         [TIMEOUT][209] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_vm@compact-64k-pages.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_vm@compact-64k-pages.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][211] ([Intel XE#3194]) -> [FAIL][212] ([Intel XE#1231] / [Intel XE#1242])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][213] ([Intel XE#1231] / [Intel XE#1242]) -> [FAIL][214] ([Intel XE#1242])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][215] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][216] ([Intel XE#3194]) +2 other tests dmesg-fail
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][217] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][218] ([Intel XE#1861])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         [TIMEOUT][219] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][220] ([Intel XE#651])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [TIMEOUT][221] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][222] ([Intel XE#656])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-adlp:         [TIMEOUT][223] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][224] ([Intel XE#653])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         [TIMEOUT][225] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][226] ([Intel XE#455])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_hdr@bpc-switch.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][227] ([Intel XE#1035]) -> [INCOMPLETE][228] ([Intel XE#1035] / [Intel XE#1195]) +1 other test incomplete
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@kms_plane@pixel-format.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][229] -> [SKIP][230] ([Intel XE#734])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][231] ([Intel XE#1729]) -> [SKIP][232] ([Intel XE#2426])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][233] ([Intel XE#2509]) -> [SKIP][234] ([Intel XE#2426])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1192]) -> [TIMEOUT][236] ([Intel XE#2961] / [Intel XE#3191])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#1999]) -> [SKIP][238] ([Intel XE#1192])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2123-526c63710d1e43d3bf56ed9260f69412533de182 -> xe-pw-140323v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2123-526c63710d1e43d3bf56ed9260f69412533de182: 526c63710d1e43d3bf56ed9260f69412533de182
  xe-pw-140323v2: 140323v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html

--===============1050266288112646719==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: bunch of struct intel_display conversions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140323/">https://patchwork.freedesktop.org/series/140323/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2123-526c63710d1e43d3bf56ed9260f69412533de182_full -&gt; xe-pw-140323v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140323v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140323v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140323v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-unmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-unmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-463/igt@xe_exec_compute_mode@many-userptr-unmap.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-mixed-many-threads-small:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140323v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910">Intel XE#2910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_psr@psr-cursor-plane-onoff@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_psr@psr-cursor-plane-onoff@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@kms_sequence@queue-idle@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_sequence@queue-idle@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-6/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-4/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-7/igt@xe_exec_basic@no-exec-null-defer-bind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-7/igt@xe_exec_basic@no-exec-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@compact-64k-pages:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@xe_vm@compact-64k-pages.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@xe_vm@compact-64k-pages.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_hdr@bpc-switch.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2123-526c63710d1e43d3bf56ed9260f69412533de182 -&gt; xe-pw-140323v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2123-526c63710d1e43d3bf56ed9260f69412533de182: 526c63710d1e43d3bf56ed9260f69412533de182<br />
  xe-pw-140323v2: 140323v2</p>

</body>
</html>

--===============1050266288112646719==--
