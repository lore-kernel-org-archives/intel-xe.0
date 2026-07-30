Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90684C55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D4510EF99;
	Thu, 30 Jul 2026 15:22:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2585710EF99;
 Thu, 30 Jul 2026 15:22:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2440056723049733426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Enable_CMRR_in_fixed-RR_VR?=
 =?utf-8?q?R_path_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 15:22:36 -0000
Message-ID: <178542495613.5683.8137105759600065321@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============2440056723049733426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable CMRR in fixed-RR VRR path (rev8)
URL   : https://patchwork.freedesktop.org/series/168613/
State : success

== Summary ==

CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_FULL -> xe-pw-168613v8_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-168613v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2652]) +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301] / [Intel XE#3149])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#8395] / [Intel XE#8396])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#8396]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#8714]) +237 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#7956])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#8714]) +172 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6964] / [Intel XE#8714])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][15] ([Intel XE#8599] / [Intel XE#8714]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][17] ([Intel XE#2134]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@fbdev@write.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@fbdev@write.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][19] ([Intel XE#8710] / [Intel XE#8714]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][21] ([Intel XE#7850]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [SKIP][23] ([Intel XE#8714]) -> [PASS][24] +235 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][25] ([Intel XE#2327]) -> [SKIP][26] ([Intel XE#8714]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][27] ([Intel XE#8714]) -> [SKIP][28] ([Intel XE#2327])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][29] ([Intel XE#1124]) -> [SKIP][30] ([Intel XE#8714]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][31] ([Intel XE#8714]) -> [SKIP][32] ([Intel XE#1124]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][33] ([Intel XE#367]) -> [SKIP][34] ([Intel XE#8714])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][35] ([Intel XE#8714]) -> [SKIP][36] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][37] ([Intel XE#2887]) -> [SKIP][38] ([Intel XE#8714]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][39] ([Intel XE#2652]) -> [SKIP][40] ([Intel XE#8714])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][41] ([Intel XE#8714]) -> [SKIP][42] ([Intel XE#2887]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][43] ([Intel XE#8714]) -> [SKIP][44] ([Intel XE#2652])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][45] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][46] ([Intel XE#8714])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cdclk@mode-transition.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][47] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][48] ([Intel XE#8714])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][49] ([Intel XE#8714]) -> [SKIP][50] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][51] ([Intel XE#2252]) -> [SKIP][52] ([Intel XE#8714])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][53] ([Intel XE#8714]) -> [SKIP][54] ([Intel XE#2252]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [FAIL][55] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][56] ([Intel XE#8714])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][57] ([Intel XE#8714]) -> [SKIP][58] ([Intel XE#2390] / [Intel XE#6974])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][59] ([Intel XE#6974]) -> [SKIP][60] ([Intel XE#8714])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][61] ([Intel XE#8714]) -> [FAIL][62] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@srm.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][63] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][64] ([Intel XE#8714])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-bmg:          [SKIP][65] ([Intel XE#8714]) -> [SKIP][66] ([Intel XE#2320])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_crc@cursor-random-128x42.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][67] ([Intel XE#2320]) -> [SKIP][68] ([Intel XE#8714])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][69] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][70] ([Intel XE#8714])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][71] ([Intel XE#8714]) -> [SKIP][72] ([Intel XE#8265]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][73] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][74] ([Intel XE#8714])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_feature_discovery@psr2.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][75] ([Intel XE#301]) -> [FAIL][76] ([Intel XE#301] / [Intel XE#3149])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][77] ([Intel XE#8714]) -> [SKIP][78] ([Intel XE#7178] / [Intel XE#7349])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][79] ([Intel XE#8714]) -> [SKIP][80] ([Intel XE#2311]) +20 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][81] ([Intel XE#4141]) -> [SKIP][82] ([Intel XE#8714]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][83] ([Intel XE#8714]) -> [SKIP][84] ([Intel XE#4141]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][85] ([Intel XE#2311]) -> [SKIP][86] ([Intel XE#8714]) +15 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][87] ([Intel XE#7061]) -> [SKIP][88] ([Intel XE#8714]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][89] ([Intel XE#8714]) -> [SKIP][90] ([Intel XE#2313]) +22 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][91] ([Intel XE#8714]) -> [SKIP][92] ([Intel XE#7061]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][93] ([Intel XE#2313]) -> [SKIP][94] ([Intel XE#8714]) +15 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][95] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][96] ([Intel XE#8714]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][97] ([Intel XE#8714]) -> [SKIP][98] ([Intel XE#7061] / [Intel XE#7356])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][99] ([Intel XE#7308]) -> [SKIP][100] ([Intel XE#8714])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          [SKIP][101] ([Intel XE#8714]) -> [SKIP][102] ([Intel XE#7283])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][103] ([Intel XE#7283]) -> [SKIP][104] ([Intel XE#8714]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][105] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][106] ([Intel XE#8714])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][107] ([Intel XE#8714]) -> [SKIP][108] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][109] ([Intel XE#8714]) -> [SKIP][110] ([Intel XE#8395] / [Intel XE#8396])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][111] ([Intel XE#8714]) -> [SKIP][112] ([Intel XE#1489]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][113] ([Intel XE#1489]) -> [SKIP][114] ([Intel XE#8714]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][115] ([Intel XE#8714]) -> [SKIP][116] ([Intel XE#2387] / [Intel XE#7429])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][117] ([Intel XE#8714]) -> [SKIP][118] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][120] ([Intel XE#8714]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_psr@psr-primary-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_psr@psr-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][121] ([Intel XE#8714]) -> [SKIP][122] ([Intel XE#2234])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][123] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][124] ([Intel XE#8714])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_rotation_crc@bad-tiling.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][125] ([Intel XE#8714]) -> [SKIP][126] ([Intel XE#3904] / [Intel XE#7342])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][127] ([Intel XE#8714]) -> [SKIP][128] ([Intel XE#2413])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][129] ([Intel XE#8714]) -> [SKIP][130] ([Intel XE#1435] / [Intel XE#8695])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          [SKIP][131] ([Intel XE#8714]) -> [SKIP][132] ([Intel XE#6503])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_sharpness_filter@filter-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][133] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][134] ([Intel XE#2426] / [Intel XE#5848])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][135] ([Intel XE#8714]) -> [SKIP][136] ([Intel XE#6599])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@engines-allowed-invalid:
    - shard-bmg:          [ABORT][137] ([Intel XE#8007]) -> [SKIP][138] ([Intel XE#8714])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_configfs@engines-allowed-invalid.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][139] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][140] ([Intel XE#8714]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][141] ([Intel XE#8714]) -> [SKIP][142] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:
    - shard-bmg:          [SKIP][143] ([Intel XE#8714]) -> [SKIP][144] ([Intel XE#8374]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][145] ([Intel XE#8374]) -> [SKIP][146] ([Intel XE#8714]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][147] ([Intel XE#8364]) -> [SKIP][148] ([Intel XE#8714]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][149] ([Intel XE#8714]) -> [SKIP][150] ([Intel XE#8364]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][151] ([Intel XE#8714]) -> [SKIP][152] ([Intel XE#8369])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][153] ([Intel XE#8369]) -> [SKIP][154] ([Intel XE#8714]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_reset@multi-queue-close-execqueues.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][155] ([Intel XE#8714]) -> [SKIP][156] ([Intel XE#8378]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr:
    - shard-bmg:          [SKIP][157] ([Intel XE#8378]) -> [SKIP][158] ([Intel XE#8714]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-userptr.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][159] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][160] ([Intel XE#8714])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_mmap@small-bar.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [FAIL][161] ([Intel XE#8714]) -> [ABORT][162] ([Intel XE#8007])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_module_load@force-load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_module_load@force-load.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          [SKIP][163] ([Intel XE#6964]) -> [SKIP][164] ([Intel XE#6964] / [Intel XE#8714])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][165] ([Intel XE#8714]) -> [SKIP][166] ([Intel XE#1420] / [Intel XE#7590])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][167] ([Intel XE#8714]) -> [SKIP][168] ([Intel XE#5694] / [Intel XE#7370])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][169] ([Intel XE#8714]) -> [SKIP][170] ([Intel XE#4733] / [Intel XE#7417])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pxp@pxp-optout.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][171] ([Intel XE#8714]) -> [SKIP][172] ([Intel XE#944]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8599
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -> xe-pw-168613v8

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd
  xe-pw-168613v8: 168613v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html

--===============2440056723049733426==
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
<tr><td><b>Series:</b></td><td>Enable CMRR in fixed-RR VRR path (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168613/">https://patchwork.freedesktop.org/series/168613/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_FULL -&gt; xe-pw-168613v8_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168613v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +237 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +172 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8599">Intel XE#8599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> +235 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_configfs@engines-allowed-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_module_load@force-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_module_load@force-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-9/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168613v8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -&gt; xe-pw-168613v8</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd<br />
  xe-pw-168613v8: 168613v8</p>

</body>
</html>

--===============2440056723049733426==--
