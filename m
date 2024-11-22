Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A0CE69173
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F46610EC01;
	Fri, 22 Nov 2024 16:19:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06D10EC00;
 Fri, 22 Nov 2024 16:19:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3192166467798301234=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/ptl=3A_Update_PTL_G?=
 =?utf-8?q?uC_revision_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 16:19:25 -0000
Message-ID: <173229236576.1756018.6013313195795062080@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121225518.10986-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241121225518.10986-1-matthew.s.atwood@intel.com>
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

--===============3192166467798301234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Update PTL GuC revision (rev3)
URL   : https://patchwork.freedesktop.org/series/141519/
State : failure

== Summary ==

CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_full -> xe-pw-141519v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141519v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141519v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141519v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@xe_exec_compute_mode@many-userptr:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_exec_compute_mode@many-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_compute_mode@many-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-141519v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#1885])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][7] ([Intel XE#3468])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#2134])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@fbdev@write.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#1033] / [Intel XE#1727])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#324]) +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2550]) +23 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-adlp:         [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2594])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_atomic@plane-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-9/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-bmg:          [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#3468])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2136]) +19 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#610])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3432])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +48 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3278])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2321])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][44] ([Intel XE#3468]) +1 other test dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#309]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2423] / [i915#2575]) +36 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2286])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2291]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#877])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#2423])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_dp_aux_dev.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#2882])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#3321] / [Intel XE#3486]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2316]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +4 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#3321] / [Intel XE#3487])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301]) +4 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [PASS][70] -> [DMESG-WARN][71] ([Intel XE#3086])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][72] ([Intel XE#1727])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2136]) +20 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2380]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][80] ([Intel XE#2705] / [Intel XE#3468])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][81] ([Intel XE#1727] / [Intel XE#3468])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#2351])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][84] ([Intel XE#2333]) +3 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][85] ([Intel XE#3468]) +3 other tests dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2311]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#656]) +14 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2313]) +7 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1503])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1450] / [Intel XE#2568])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1450]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2423] / [i915#2575]) +58 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_lease@invalid-create-leases.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2763]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][101] ([Intel XE#2029])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2446])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1727] / [Intel XE#3468])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2446]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1439] / [Intel XE#3141])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2893])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1489]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#3414]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#3414])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][114] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_universal_plane@universal-plane-pageflip-windowed.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#756])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1447])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1062])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2905]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2905]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2905])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [PASS][121] -> [FAIL][122] ([Intel XE#2364])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][123] ([Intel XE#2364])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#688]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1392]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2322]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-bindexecqueue:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][127] ([Intel XE#1727])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_compute_mode@many-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][128] ([Intel XE#1727] / [Intel XE#3468])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - shard-bmg:          [PASS][130] -> [DMESG-WARN][131] ([Intel XE#3468]) +9 other tests dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][132] ([Intel XE#3467])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][133] ([Intel XE#3467])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3467])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#3546])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_module_load@many-reload.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][138] -> [DMESG-WARN][139] ([Intel XE#3467])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_module_load@unload.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_module_load@unload.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3573])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][141] ([Intel XE#2514])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pat@prime-self-import-coh:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1130]) +33 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pat@prime-self-import-coh.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][143] -> [ABORT][144] ([Intel XE#1358] / [Intel XE#1607])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-3/igt@xe_pm@s4-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][145] -> [ABORT][146] ([Intel XE#1794])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#1130]) +122 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#3249]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-adlp:         [DMESG-WARN][151] ([Intel XE#3086]) -> [PASS][152] +3 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_atomic_interruptible@legacy-cursor.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-1/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2136]) -> [PASS][154] +20 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][156] +8 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][157] -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1727]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][163] ([Intel XE#2291]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][165] ([Intel XE#2316]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][167] ([Intel XE#3098]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
    - shard-bmg:          [FAIL][171] ([Intel XE#3486]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][173] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][175] ([Intel XE#886]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2423] / [i915#2575]) -> [PASS][178] +58 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_lease@lease-unleased-connector@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][179] -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_lease@lease-unleased-connector@pipe-d-dp-2.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_lease@lease-unleased-connector@pipe-d-dp-2.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][181] ([Intel XE#2571]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][183] ([Intel XE#718]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2446]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          [DMESG-FAIL][191] ([Intel XE#3468]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][193] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [TIMEOUT][195] ([Intel XE#1473]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1130]) -> [PASS][198] +95 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][199] -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][201] ([Intel XE#3371]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-adlp:         [DMESG-WARN][203] ([Intel XE#3515]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3515]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-bmg:          [DMESG-WARN][207] ([Intel XE#3468]) -> [PASS][208] +16 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][212] +2 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@d3hot-mmap-vram.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [DMESG-FAIL][213] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@s3-mocs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][215] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][217] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#316]) -> [SKIP][220] ([Intel XE#2136] / [Intel XE#2351])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][222] ([Intel XE#316]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2136]) -> [SKIP][224] ([Intel XE#316])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#316]) -> [SKIP][226] ([Intel XE#2136]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][227] ([Intel XE#1231]) -> [DMESG-FAIL][228] ([Intel XE#324])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][229] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][230] ([Intel XE#3468])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#2136]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136]) -> [SKIP][234] ([Intel XE#1124]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][236] ([Intel XE#1124])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1124]) -> [SKIP][238] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#367]) -> [SKIP][240] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2191]) -> [SKIP][242] ([Intel XE#2423] / [i915#2575])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [SKIP][244] ([Intel XE#367]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][246] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136]) -> [SKIP][248] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#2907]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][252] ([Intel XE#455] / [Intel XE#787])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][254] ([Intel XE#2136]) +11 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][256] ([Intel XE#314])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][258] ([Intel XE#373]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#306]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#306]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#373]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][265] ([Intel XE#1178]) -> [SKIP][266] ([Intel XE#2423] / [i915#2575])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#307]) -> [SKIP][268] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][269] ([Intel XE#1188]) -> [SKIP][270] ([Intel XE#2423] / [i915#2575])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_content_protection@uevent.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-bmg:          [DMESG-FAIL][271] ([Intel XE#3468]) -> [DMESG-WARN][272] ([Intel XE#3468])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [SKIP][274] ([Intel XE#308])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2423] / [i915#2575]) -> [SKIP][276] ([Intel XE#323]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#455]) -> [SKIP][278] ([Intel XE#2136]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#701]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2423] / [i915#2575]) -> [SKIP][284] ([Intel XE#1138])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][285] ([Intel XE#2882]) -> [SKIP][286] ([Intel XE#2316])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][287] ([Intel XE#301]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [FAIL][289] ([Intel XE#3149] / [Intel XE#886]) -> [FAIL][290] ([Intel XE#886])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2136]) -> [DMESG-WARN][292] ([Intel XE#1727])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][293] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][294] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][296] ([Intel XE#455]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#651]) +14 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][299] ([Intel XE#2311]) -> [SKIP][300] ([Intel XE#2312]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#651]) -> [SKIP][302] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][303] ([Intel XE#2312]) -> [FAIL][304] ([Intel XE#2333]) +4 other tests fail
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][305] ([Intel XE#2333]) -> [SKIP][306] ([Intel XE#2312]) +6 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [INCOMPLETE][307] ([Intel XE#1727] / [Intel XE#2050]) -> [FAIL][308] ([Intel XE#2333])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [INCOMPLETE][309] -> [FAIL][310] ([Intel XE#2333])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][311] ([Intel XE#2333]) -> [DMESG-FAIL][312] ([Intel XE#3468])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][313] ([Intel XE#3468]) -> [SKIP][314] ([Intel XE#2312])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][315] ([Intel XE#3468]) -> [FAIL][316] ([Intel XE#2333]) +2 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [INCOMPLETE][317] ([Intel XE#3468]) -> [SKIP][318] ([Intel XE#2136])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#658]) -> [SKIP][320] ([Intel XE#2136] / [Intel XE#2351])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#651]) -> [SKIP][322] ([Intel XE#2136]) +15 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#2311]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][326] ([Intel XE#651]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][327] ([Intel XE#2312]) -> [SKIP][328] ([Intel XE#2313]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][330] ([Intel XE#653]) +8 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136]) -> [SKIP][332] ([Intel XE#455]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2136]) -> [SKIP][334] ([Intel XE#653]) +10 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][335] ([Intel XE#2313]) -> [SKIP][336] ([Intel XE#2312]) +11 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#653]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#653]) -> [SKIP][340] ([Intel XE#2136]) +21 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#605]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][343] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][344] ([Intel XE#3544])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-dg2-set2:     [DMESG-WARN][345] ([Intel XE#1727]) -> [SKIP][346] ([Intel XE#2423] / [i915#2575])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_invalid_mode@zero-vdisplay.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#2927])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][349] ([Intel XE#3468]) -> [DMESG-FAIL][350] ([Intel XE#3468])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2938]) -> [SKIP][356] ([Intel XE#2136])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1122]) -> [SKIP][358] ([Intel XE#2136] / [Intel XE#2351])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136]) -> [SKIP][360] ([Intel XE#3309])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][362] ([Intel XE#1129])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2446]) -> [DMESG-WARN][364] ([Intel XE#1727] / [Intel XE#3468])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [ABORT][365] ([Intel XE#3468]) -> [SKIP][366] ([Intel XE#2446])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#1489]) +4 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1489]) -> [SKIP][370] ([Intel XE#2136]) +6 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136]) -> [SKIP][372] ([Intel XE#1122])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1122]) -> [SKIP][374] ([Intel XE#2136])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][376] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][378] ([Intel XE#2136]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2136]) -> [SKIP][380] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2351]) -> [SKIP][382] ([Intel XE#2850] / [Intel XE#929])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][384] ([Intel XE#2850] / [Intel XE#929])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#3414]) -> [SKIP][386] ([Intel XE#2423] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2423] / [i915#2575]) -> [SKIP][388] ([Intel XE#1127])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2423] / [i915#2575]) -> [SKIP][390] ([Intel XE#3414]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][391] ([Intel XE#3559]) -> [DMESG-FAIL][392] ([Intel XE#3468])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][393] ([Intel XE#1729]) -> [SKIP][394] ([Intel XE#2426])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][395] ([Intel XE#1729]) -> [SKIP][396] ([Intel XE#362])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][397] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][398] ([Intel XE#3468])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2423] / [i915#2575]) -> [SKIP][400] ([Intel XE#455]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#455]) -> [SKIP][402] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_vrr@flipline.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#756]) -> [SKIP][404] ([Intel XE#2423] / [i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#1123]) -> [SKIP][406] ([Intel XE#1130]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1130]) -> [SKIP][408] ([Intel XE#1123])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1126]) -> [SKIP][410] ([Intel XE#1130])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1130]) -> [SKIP][412] ([Intel XE#2905]) +7 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2905]) -> [SKIP][414] ([Intel XE#1130]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1130]) -> [FAIL][416] ([Intel XE#1600])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1130]) -> [SKIP][418] ([Intel XE#288]) +21 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#288]) -> [SKIP][420] ([Intel XE#1130]) +20 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][421] ([Intel XE#3371]) -> [SKIP][422] ([Intel XE#1130])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][423] ([Intel XE#3467]) -> [SKIP][424] ([Intel XE#1130])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [DMESG-WARN][425] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][426] ([Intel XE#3467]) +1 other test dmesg-warn
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1130]) -> [DMESG-WARN][428] ([Intel XE#1727] / [Intel XE#3343])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1130]) -> [DMESG-WARN][430] ([Intel XE#3467])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-dg2-set2:     [DMESG-WARN][431] ([Intel XE#3343]) -> [SKIP][432] ([Intel XE#1130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][433] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][434] ([Intel XE#3467])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#3573]) -> [SKIP][436] ([Intel XE#1130]) +4 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_oa@polling-small-buf.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1130]) -> [SKIP][438] ([Intel XE#3573]) +2 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#977]) -> [SKIP][440] ([Intel XE#1130])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1130]) -> [SKIP][442] ([Intel XE#2838] / [Intel XE#979])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][444] ([Intel XE#1130]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1130]) -> [DMESG-WARN][446] ([Intel XE#1727] / [Intel XE#3468])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1130]) -> [DMESG-WARN][448] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@s4-mocs.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#944]) -> [SKIP][450] ([Intel XE#1130])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1130]) -> [SKIP][452] ([Intel XE#944]) +2 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][453] ([Intel XE#2919]) -> [SKIP][454] ([Intel XE#1130])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@basic-wedged.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [ABORT][455] ([Intel XE#3421]) -> [SKIP][456] ([Intel XE#1130])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -> xe-pw-141519v3

  IGT_8121: 8121
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199
  xe-pw-141519v3: 141519v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/index.html

--===============3192166467798301234==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Update PTL GuC revision (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141519/">https://patchwork.freedesktop.org/series/141519/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_full -&gt; xe-pw-141519v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141519v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141519v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141519v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_exec_compute_mode@many-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_compute_mode@many-userptr.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141519v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-6/igt@kms_atomic@plane-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-9/igt@kms_atomic@plane-cursor-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_lease@invalid-create-leases.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_compute_mode@many-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pat@prime-self-import-coh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-3/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +122 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-2/igt@kms_atomic_interruptible@legacy-cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-1/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +58 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_lease@lease-unleased-connector@pipe-d-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_lease@lease-unleased-connector@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">PASS</a> +95 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_pm@d3hot-mmap-vram.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_pm@s3-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_invalid_mode@zero-vdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Intel XE#3559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-433/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-466/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-435/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141519v3/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -&gt; xe-pw-141519v3</li>
</ul>
<p>IGT_8121: 8121<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199<br />
  xe-pw-141519v3: 141519v3</p>

</body>
</html>

--===============3192166467798301234==--
