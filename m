Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E32C55166
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFC010EFC5;
	Thu, 30 Jul 2026 16:01:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932410EFC5;
 Thu, 30 Jul 2026 16:01:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0056784624171308065=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_DP-HDMI_PCON_DSC_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 16:01:07 -0000
Message-ID: <178542726734.5683.17439175928943924728@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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

--===============0056784624171308065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DP-HDMI PCON DSC fixes
URL   : https://patchwork.freedesktop.org/series/171346/
State : success

== Summary ==

CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_FULL -> xe-pw-171346v1_FULL
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

  Here are the changes found in xe-pw-171346v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#8711] / [Intel XE#8714])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@core_getversion@all-cards.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@fbdev@info.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2652]) +15 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#8395] / [Intel XE#8396])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#8396]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#8714]) +237 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#8714]) +494 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [PASS][14] -> [ABORT][15] ([Intel XE#8007])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6964] / [Intel XE#8714])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][17] ([Intel XE#8599] / [Intel XE#8714]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][19] ([Intel XE#2134]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@fbdev@write.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@fbdev@write.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][21] ([Intel XE#301]) -> [PASS][22] +2 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][23] ([Intel XE#8710] / [Intel XE#8714]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][25] ([Intel XE#8714]) -> [PASS][26] +666 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][27] ([Intel XE#7850]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [FAIL][29] ([Intel XE#8714]) -> [PASS][30] +1 other test pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_module_load@force-load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_module_load@force-load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][31] ([Intel XE#2233]) -> [SKIP][32] ([Intel XE#8714])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][33] ([Intel XE#2370]) -> [SKIP][34] ([Intel XE#8714])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][35] ([Intel XE#8714]) -> [SKIP][36] ([Intel XE#2327]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][37] ([Intel XE#2327]) -> [SKIP][38] ([Intel XE#8714]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][39] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][40] ([Intel XE#8714]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][41] ([Intel XE#1124]) -> [SKIP][42] ([Intel XE#8714]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][43] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][44] ([Intel XE#8714])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][45] ([Intel XE#8714]) -> [SKIP][46] ([Intel XE#1124]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][47] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][48] ([Intel XE#8714])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][49] ([Intel XE#8714]) -> [SKIP][50] ([Intel XE#610] / [Intel XE#7387])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][51] ([Intel XE#7679]) -> [SKIP][52] ([Intel XE#8714])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][53] ([Intel XE#8714]) -> [SKIP][54] ([Intel XE#367]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][55] ([Intel XE#367]) -> [SKIP][56] ([Intel XE#8714])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][57] ([Intel XE#8714]) -> [SKIP][58] ([Intel XE#2887]) +13 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][59] ([Intel XE#8714]) -> [SKIP][60] ([Intel XE#3432])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][61] ([Intel XE#2652]) -> [SKIP][62] ([Intel XE#8714])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][63] ([Intel XE#3432]) -> [SKIP][64] ([Intel XE#8714])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][65] ([Intel XE#2887]) -> [SKIP][66] ([Intel XE#8714]) +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][67] ([Intel XE#8714]) -> [SKIP][68] ([Intel XE#2652]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][69] ([Intel XE#8714]) -> [SKIP][70] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][71] ([Intel XE#7358]) -> [SKIP][72] ([Intel XE#8714])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          [SKIP][73] ([Intel XE#8714]) -> [SKIP][74] ([Intel XE#7358]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][75] ([Intel XE#2252]) -> [SKIP][76] ([Intel XE#8714]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          [SKIP][77] ([Intel XE#8714]) -> [SKIP][78] ([Intel XE#2252]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][79] ([Intel XE#7642]) -> [SKIP][80] ([Intel XE#8714])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][81] ([Intel XE#8714]) -> [SKIP][82] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][83] ([Intel XE#8714]) -> [FAIL][84] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][85] ([Intel XE#8714]) -> [SKIP][86] ([Intel XE#7642])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@lic-type-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][87] ([Intel XE#2320]) -> [SKIP][88] ([Intel XE#8714]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][89] ([Intel XE#8714]) -> [SKIP][90] ([Intel XE#2320]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][91] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][92] ([Intel XE#8714])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][93] ([Intel XE#8714]) -> [SKIP][94] ([Intel XE#2286] / [Intel XE#6035])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][95] ([Intel XE#8714]) -> [SKIP][96] ([Intel XE#4210] / [Intel XE#7467])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][97] ([Intel XE#8714]) -> [SKIP][98] ([Intel XE#1508])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          [SKIP][99] ([Intel XE#8265]) -> [SKIP][100] ([Intel XE#8714]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_dsc@dsc-basic-bigjoiner.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][101] ([Intel XE#8714]) -> [SKIP][102] ([Intel XE#8265]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][103] ([Intel XE#1138] / [Intel XE#7344]) -> [SKIP][104] ([Intel XE#8714])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][105] ([Intel XE#8714]) -> [SKIP][106] ([Intel XE#7178] / [Intel XE#7349])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][107] ([Intel XE#8714]) -> [SKIP][108] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][109] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][110] ([Intel XE#8714]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][111] ([Intel XE#8714]) -> [SKIP][112] ([Intel XE#2311]) +59 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][113] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][114] ([Intel XE#8714]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][115] ([Intel XE#7061]) -> [SKIP][116] ([Intel XE#8714]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][117] ([Intel XE#4141]) -> [SKIP][118] ([Intel XE#8714]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][119] ([Intel XE#8714]) -> [SKIP][120] ([Intel XE#4141]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][121] ([Intel XE#8714]) -> [SKIP][122] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][123] ([Intel XE#8714]) -> [SKIP][124] ([Intel XE#2352] / [Intel XE#7399])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2311]) -> [SKIP][126] ([Intel XE#8714]) +40 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][127] ([Intel XE#8714]) -> [SKIP][128] ([Intel XE#7061]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          [SKIP][129] ([Intel XE#7399]) -> [SKIP][130] ([Intel XE#8714])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#8714]) -> [SKIP][132] ([Intel XE#2313]) +58 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][133] ([Intel XE#8714]) -> [SKIP][134] ([Intel XE#7399])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#2313]) -> [SKIP][136] ([Intel XE#8714]) +46 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][137] ([Intel XE#8714]) -> [SKIP][138] ([Intel XE#3374] / [Intel XE#3544])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][139] ([Intel XE#1503]) -> [SKIP][140] ([Intel XE#8714])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][141] ([Intel XE#8714]) -> [SKIP][142] ([Intel XE#4298] / [Intel XE#5873])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][143] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][144] ([Intel XE#8714])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][145] ([Intel XE#8714]) -> [SKIP][146] ([Intel XE#8348])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][147] ([Intel XE#7591]) -> [SKIP][148] ([Intel XE#8714])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][149] ([Intel XE#8714]) -> [SKIP][150] ([Intel XE#2486])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][151] ([Intel XE#7283]) -> [SKIP][152] ([Intel XE#8714]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][153] ([Intel XE#8714]) -> [SKIP][154] ([Intel XE#7283]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][155] ([Intel XE#8714]) -> [SKIP][156] ([Intel XE#2393])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][157] ([Intel XE#8714]) -> [SKIP][158] ([Intel XE#5021] / [Intel XE#7377])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][159] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][160] ([Intel XE#8714])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][161] ([Intel XE#8714]) -> [SKIP][162] ([Intel XE#5020] / [Intel XE#7348])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][163] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][164] ([Intel XE#8714])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][165] ([Intel XE#8714]) -> [SKIP][166] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][167] ([Intel XE#8714]) -> [SKIP][168] ([Intel XE#8395] / [Intel XE#8396])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][169] ([Intel XE#8714]) -> [SKIP][170] ([Intel XE#7794])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][171] ([Intel XE#7794]) -> [SKIP][172] ([Intel XE#8714])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][173] ([Intel XE#8714]) -> [SKIP][174] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][175] ([Intel XE#8714]) -> [SKIP][176] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][177] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][178] ([Intel XE#8714])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][179] ([Intel XE#1489]) -> [SKIP][180] ([Intel XE#8714]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][181] ([Intel XE#8714]) -> [SKIP][182] ([Intel XE#1489]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][183] ([Intel XE#8714]) -> [SKIP][184] ([Intel XE#2387] / [Intel XE#7429])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][185] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][186] ([Intel XE#8714]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr2_su@page_flip-nv12.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][187] ([Intel XE#8714]) -> [SKIP][188] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][190] ([Intel XE#8714]) +7 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr@pr-primary-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][191] ([Intel XE#8714]) -> [SKIP][192] ([Intel XE#2234])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][193] ([Intel XE#7795]) -> [SKIP][194] ([Intel XE#8714])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][195] ([Intel XE#8714]) -> [SKIP][196] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][197] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][198] ([Intel XE#8714])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][199] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][200] ([Intel XE#8714]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][201] ([Intel XE#8714]) -> [SKIP][202] ([Intel XE#2413]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][203] ([Intel XE#8714]) -> [SKIP][204] ([Intel XE#1435] / [Intel XE#8695]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][205] ([Intel XE#8714]) -> [SKIP][206] ([Intel XE#6503]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][207] ([Intel XE#6503]) -> [SKIP][208] ([Intel XE#8714]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][209] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][210] ([Intel XE#2426] / [Intel XE#5848])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][211] ([Intel XE#1499]) -> [SKIP][212] ([Intel XE#8714]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_vrr@max-min.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][213] ([Intel XE#8714]) -> [SKIP][214] ([Intel XE#1499]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][215] ([Intel XE#6599]) -> [SKIP][216] ([Intel XE#8714])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][217] ([Intel XE#8714]) -> [SKIP][218] ([Intel XE#6599])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@engines-allowed-invalid:
    - shard-bmg:          [ABORT][219] ([Intel XE#8007]) -> [SKIP][220] ([Intel XE#8714])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_configfs@engines-allowed-invalid.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          [SKIP][221] ([Intel XE#8370]) -> [SKIP][222] ([Intel XE#8714]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_evict@evict-mixed-threads-small-multi-queue.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][223] ([Intel XE#8714]) -> [SKIP][224] ([Intel XE#8370])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][225] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][226] ([Intel XE#8714]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][227] ([Intel XE#8714]) -> [SKIP][228] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][229] ([Intel XE#8714]) -> [SKIP][230] ([Intel XE#8374]) +10 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][231] ([Intel XE#8374]) -> [SKIP][232] ([Intel XE#8714]) +9 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-queues-dyn-priority-smem:
    - shard-bmg:          [SKIP][233] ([Intel XE#8364]) -> [SKIP][234] ([Intel XE#8714]) +22 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][235] ([Intel XE#8714]) -> [SKIP][236] ([Intel XE#8364]) +26 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][237] ([Intel XE#8714]) -> [SKIP][238] ([Intel XE#8369]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          [SKIP][239] ([Intel XE#8369]) -> [SKIP][240] ([Intel XE#8714]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][241] ([Intel XE#8714]) -> [SKIP][242] ([Intel XE#8378]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          [SKIP][243] ([Intel XE#8378]) -> [SKIP][244] ([Intel XE#8714]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          [SKIP][245] ([Intel XE#6964]) -> [SKIP][246] ([Intel XE#6964] / [Intel XE#8714]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          [SKIP][247] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][248] ([Intel XE#6964]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-basic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          [SKIP][249] ([Intel XE#8714]) -> [SKIP][250] ([Intel XE#7793]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_page_reclaim@binds-null-vma.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][251] ([Intel XE#7793]) -> [SKIP][252] ([Intel XE#8714])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_page_reclaim@random.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_page_reclaim@random.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][253] ([Intel XE#7590]) -> [SKIP][254] ([Intel XE#8714])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][255] ([Intel XE#8714]) -> [SKIP][256] ([Intel XE#1420] / [Intel XE#7590])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][257] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][258] ([Intel XE#8714])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_pat@pat-index-xelpg.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][259] ([Intel XE#8714]) -> [SKIP][260] ([Intel XE#5694] / [Intel XE#7370])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][261] ([Intel XE#8714]) -> [SKIP][262] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][263] ([Intel XE#7599]) -> [SKIP][264] ([Intel XE#8714])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][265] ([Intel XE#8714]) -> [SKIP][266] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][267] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][268] ([Intel XE#8714]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][269] ([Intel XE#944]) -> [SKIP][270] ([Intel XE#8714]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][271] ([Intel XE#8714]) -> [SKIP][272] ([Intel XE#944]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8599
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -> xe-pw-171346v1

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd
  xe-pw-171346v1: 171346v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/index.html

--===============0056784624171308065==
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
<tr><td><b>Series:</b></td><td>DP-HDMI PCON DSC fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171346/">https://patchwork.freedesktop.org/series/171346/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_FULL -&gt; xe-pw-171346v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171346v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711">Intel XE#8711</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +237 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +494 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8599">Intel XE#8599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +666 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-8/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_module_load@force-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_module_load@force-load.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_configfs@engines-allowed-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-10/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-6/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-10/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171346v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd -&gt; xe-pw-171346v1</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd: 5e24f68d311764bf343f9def49b752b509dfd5fd<br />
  xe-pw-171346v1: 171346v1</p>

</body>
</html>

--===============0056784624171308065==--
