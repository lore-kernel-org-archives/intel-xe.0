Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C20F0180C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 07:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D9110E3A2;
	Fri,  6 Mar 2026 07:59:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195F10E3A1;
 Fri,  6 Mar 2026 07:59:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6065484677408210235=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Refactor_LT_PHY_PLL_handli?=
 =?utf-8?q?ng_to_use_DPLL_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 07:59:34 -0000
Message-ID: <177278397405.324953.6387324210642210697@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304131423.1017821-1-mika.kahola@intel.com>
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
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

--===============6065484677408210235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor LT PHY PLL handling to use DPLL framework (rev2)
URL   : https://patchwork.freedesktop.org/series/161586/
State : failure

== Summary ==

CI Bug Log - changes from xe-4661-1242b36e0da950a66f2267e1c15395962dad569c_FULL -> xe-pw-161586v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161586v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161586v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161586v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +41 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@kms_flip@basic-flip-vs-dpms@c-dp2.html

  * igt@kms_flip@dpms-vs-vblank-race@b-edp1:
    - shard-lnl:          [PASS][4] -> [DMESG-WARN][5] +17 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race@b-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:
    - shard-bmg:          [PASS][6] -> [ABORT][7] +19 other tests abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-lnl:          [PASS][8] -> [ABORT][9] +20 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@kms_pm_dc@dc9-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][10] +1 other test abort
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          [SKIP][14] ([Intel XE#5694] / [Intel XE#7370]) -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@xe_pm@d3cold-i2c.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          [SKIP][16] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) -> [ABORT][17] +3 other tests abort
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          [SKIP][18] ([Intel XE#2284] / [Intel XE#7370]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_pm@d3cold-mocs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          [SKIP][20] ([Intel XE#1948]) -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][22] ([Intel XE#2284] / [Intel XE#7370]) -> [ABORT][23] +3 other tests abort
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-161586v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6011])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_3d@basic.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2191] / [Intel XE#7373])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512] / [Intel XE#7392])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#3304] / [Intel XE#7374])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#307] / [Intel XE#6974])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#3304])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#4422] / [Intel XE#7442])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1421]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7178] / [Intel XE#7349])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7061] / [Intel XE#7356])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1470] / [Intel XE#2853])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1503])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2893] / [Intel XE#7304])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1128] / [Intel XE#7413])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1406])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#4459]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][49] ([Intel XE#6390] / [Intel XE#7461]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#4837] / [Intel XE#6665])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7482]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1392])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7136])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6874]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-userptr.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2833])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4130] / [Intel XE#7366])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#3342])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][59] ([Intel XE#367] / [Intel XE#7354]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][61] ([Intel XE#301]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][63] ([Intel XE#6321]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [ABORT][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [SKIP][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-6/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-3/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-3/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-5/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [SKIP][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-7/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-7/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-3/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-4/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-7/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7392
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7461
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482


Build changes
-------------

  * Linux: xe-4661-1242b36e0da950a66f2267e1c15395962dad569c -> xe-pw-161586v2

  IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4661-1242b36e0da950a66f2267e1c15395962dad569c: 1242b36e0da950a66f2267e1c15395962dad569c
  xe-pw-161586v2: 161586v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/index.html

--===============6065484677408210235==
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
<tr><td><b>Series:</b></td><td>Refactor LT PHY PLL handling to use DPLL fra=
mework (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161586/">https://patchwork.freedesktop.org/series/161586/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161586v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161586v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4661-1242b36e0da950a66f2267e1c15395962=
dad569c_FULL -&gt; xe-pw-161586v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161586v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-161586v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1615=
86v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@kms_flip=
@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@kms_fl=
ip@2x-dpms-vs-vblank-race@cd-dp2-hdmi-a3.html">DMESG-WARN</a> +41 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@kms_flip@basic-flip-vs-dpms@c=
-dp2.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@kms_flip=
@dpms-vs-vblank-race@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@kms_flip@dpms-vs-=
vblank-race@b-edp1.html">DMESG-WARN</a> +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-d=
p2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v=
2/shard-bmg-3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible@a-dp2.html">ABORT</a> +19 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@kms_pm_d=
c@dc9-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@kms_pm_dc@dc9-dpms.html">ABORT</a>=
 +20 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dp=
ms-rpm@pipe-a-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5/igt@kms_vbla=
nk@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/ig=
t@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">INCOMPLETE</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_pm@d3=
cold-i2c.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_pm@d3=
cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-=
lnl-6/igt@xe_pm@d3cold-mmap-vram.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_pm@d=
3cold-mocs.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_pm@d3=
hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_pm@d3hot-mmap-=
vram.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-=
7/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a> +3 other tests abort</=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161586v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_3d@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel =
XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7392">Intel XE#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc=
-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-9/igt@kms_flip=
@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-4/igt@kms_flip@flip-vs-s=
uspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6390">Intel XE#6390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7461">Intel XE#7461</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_eudebug_online@tdctl-param=
eters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_evict@evict-threads-large.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-v=
irtual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_exec_multi_queue@many-queu=
es-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@kms_bw@l=
inear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/=
shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shar=
d-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_exec_=
threads@threads-mixed-shared-vm-userptr-invalidate.html">ABORT</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad=
569c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c1539596=
2dad569c/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c153=
95962dad569c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1=
c15395962dad569c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f22=
67e1c15395962dad569c/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a6=
6f2267e1c15395962dad569c/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da9=
50a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e=
0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242=
b36e0da950a66f2267e1c15395962dad569c/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-=
1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-1/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569=
c/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
586v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161586v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
586v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
586v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161586v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
586v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161586v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
586v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161586v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161586v2/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad=
569c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c1539596=
2dad569c/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c153=
95962dad569c/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1=
c15395962dad569c/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f22=
67e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a6=
6f2267e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da9=
50a66f2267e1c15395962dad569c/shard-bmg-9/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e=
0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-1242=
b36e0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4661-=
1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569c/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4661-1242b36e0da950a66f2267e1c15395962dad569=
c/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1586v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1586v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161586v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1586v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161586v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1586v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161586v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bm=
g-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-9/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1586v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161586v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v2/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4661-1242b36e0da950a66f2267e1c15395962dad569c -&gt; xe-pw-161=
586v2</li>
</ul>
<p>IGT_8781: 911c75d8ee24b6d42d31e76bc60149a9350f1190 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4661-1242b36e0da950a66f2267e1c15395962dad569c: 1242b36e0da950a66f2267e=
1c15395962dad569c<br />
  xe-pw-161586v2: 161586v2</p>

</body>
</html>

--===============6065484677408210235==--
