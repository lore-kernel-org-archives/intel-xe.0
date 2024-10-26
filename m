Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B51D116E4
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 03:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B9210E156;
	Sat, 26 Oct 2024 03:25:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550F010E156;
 Sat, 26 Oct 2024 03:25:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3196795690667273888=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Add_6k_resolution_support_for_a?=
 =?utf-8?q?_single_CRTC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Oct 2024 03:25:21 -0000
Message-ID: <172991312133.1334319.15655524698432727803@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024035552.94363-1-suraj.kandpal@intel.com>
In-Reply-To: <20241024035552.94363-1-suraj.kandpal@intel.com>
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

--===============3196795690667273888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add 6k resolution support for a single CRTC (rev2)
URL   : https://patchwork.freedesktop.org/series/139979/
State : failure

== Summary ==

CI Bug Log - changes from xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e_full -> xe-pw-139979v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139979v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139979v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139979v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +8 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vblank@wait-forked:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-2/igt@kms_vblank@wait-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-7/igt@kms_vblank@wait-forked.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +12 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-lnl:          [PASS][7] -> [DMESG-WARN][8] +8 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-basic.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][12] ([Intel XE#734]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-139979v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2550]) +23 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1701]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][17] ([Intel XE#1874])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#3113])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#787]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#373]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#307])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#309]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#877])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#323]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3184])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#776])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301]) +7 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#301]) +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#2882]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@a-dp2.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#886]) +7 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#3149] / [Intel XE#886])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#301]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#2333]) +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#651]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#653]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#656]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#605])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2501])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][67] -> [FAIL][68] ([Intel XE#1874]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#361])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][71] ([Intel XE#3177]) +4 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#718])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#1430])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#908])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#2953])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1489]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1489]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1489])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#2948]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#327])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#899]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#756])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#756])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1123])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#2667])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-idle.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2905]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2905]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#2905]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][98] -> [INCOMPLETE][99] ([Intel XE#1473])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#1000])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][102] ([Intel XE#1473])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][103] -> [TIMEOUT][104] ([Intel XE#1473]) +1 other test timeout
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2322]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#288]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - shard-lnl:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#2687])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-bmg:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#3230])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-7/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-lnl:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3230]) +1 other test dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#3230])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-8/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-4/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [PASS][117] -> [DMESG-WARN][118] ([Intel XE#358]) +4 other tests dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][119] ([Intel XE#358])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [PASS][120] -> [DMESG-WARN][121] ([Intel XE#358]) +5 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [PASS][122] -> [DMESG-WARN][123] ([Intel XE#3230])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [PASS][124] -> [SKIP][125] ([Intel XE#1192]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_live_ktest@xe_bo.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1192])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [PASS][128] -> [SKIP][129] ([Intel XE#1192])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2457])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@disabled-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2541])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2541]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_oa@rc6-disable.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1948])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2284]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][135] -> [ABORT][136] ([Intel XE#1607] / [Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][137] -> [ABORT][138] ([Intel XE#1794])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-adlp:         [PASS][139] -> [ABORT][140] ([Intel XE#1794])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#944])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#944]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#944])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][144] ([Intel XE#827]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#3194]) -> [PASS][147] +3 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][148] ([Intel XE#1426]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][150] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1195]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][154] -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1:
    - shard-adlp:         [TIMEOUT][156] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][157] +3 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][158] ([Intel XE#301]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#301]) -> [PASS][161] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][162] ([Intel XE#2953]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-lnl:          [FAIL][164] ([Intel XE#886]) -> [PASS][165] +7 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear:
    - shard-adlp:         [SKIP][166] -> [PASS][167] +4 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][168] ([Intel XE#1874]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-WARN][170] ([Intel XE#1727]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][172] -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#361]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-adlp:         [DMESG-WARN][176] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_pm_lpsp@kms-lpsp.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          [FAIL][178] ([Intel XE#2948]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][180] ([Intel XE#1523]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-7/igt@kms_vblank@accuracy-idle.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-7/igt@kms_vblank@accuracy-idle.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][182] ([Intel XE#1600]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][184] ([Intel XE#3184]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][186] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][188] ([Intel XE#1242]) -> [DMESG-FAIL][189] ([Intel XE#3194])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][190] ([Intel XE#3194]) -> [FAIL][191] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][192] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#2055]) -> [FAIL][193] ([Intel XE#1874])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [TIMEOUT][194] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][195] ([Intel XE#1861])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-adlp:         [TIMEOUT][196] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][197] ([Intel XE#455])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][198] ([Intel XE#2426]) -> [FAIL][199] ([Intel XE#1729])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#362]) -> [FAIL][201] ([Intel XE#1729])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1500]) -> [SKIP][203] ([Intel XE#362])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-adlp:         [FAIL][204] ([Intel XE#1999]) -> [SKIP][205] ([Intel XE#1192])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@xe_live_ktest@xe_mocs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html
    - shard-dg2-set2:     [FAIL][206] ([Intel XE#1999]) -> [SKIP][207] ([Intel XE#1192])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e -> xe-pw-139979v2

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e: 790c7308eb96861950ceddfd5a0f410cc3306c2e
  xe-pw-139979v2: 139979v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/index.html

--===============3196795690667273888==
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
<tr><td><b>Series:</b></td><td>Add 6k resolution support for a single CRTC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139979/">https://patchwork.freedesktop.org/series/139979/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e_full -&gt; xe-pw-139979v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139979v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139979v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139979v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-2/igt@kms_vblank@wait-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-7/igt@kms_vblank@wait-forked.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-8/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-8/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-basic.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_dc@dc9-dpms:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139979v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-7/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-8/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-4/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-linear.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_pm_lpsp@kms-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-7/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-7/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-adlp-1/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139979v2/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e -&gt; xe-pw-139979v2</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2118-790c7308eb96861950ceddfd5a0f410cc3306c2e: 790c7308eb96861950ceddfd5a0f410cc3306c2e<br />
  xe-pw-139979v2: 139979v2</p>

</body>
</html>

--===============3196795690667273888==--
