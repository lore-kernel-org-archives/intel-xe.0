Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D961E7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 14:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B0F10E4BC;
	Wed,  4 Dec 2024 14:12:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863910E2AA;
 Wed,  4 Dec 2024 14:12:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4734246126524893330=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Use_managed_BO_i?=
 =?utf-8?q?n_memirq?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 14:12:49 -0000
Message-ID: <173332156961.2501704.10743822303136959573@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204111655.1293-1-ilia.levi@intel.com>
In-Reply-To: <20241204111655.1293-1-ilia.levi@intel.com>
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

--===============4734246126524893330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use managed BO in memirq
URL   : https://patchwork.freedesktop.org/series/142108/
State : failure

== Summary ==

CI Bug Log - changes from xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_full -> xe-pw-142108v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142108v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142108v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142108v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-7/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-5/igt@core_hotunplug@hotrebind-lateclose.html

  
New tests
---------

  New tests have been introduced between xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_full and xe-pw-142108v1_full:

### New IGT tests (4) ###

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@crc-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  

Known issues
------------

  Here are the changes found in xe-pw-142108v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3086]) +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][8] ([Intel XE#2715]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#3640]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#2597])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#2597] / [Intel XE#2635])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#2333]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2313]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1727] / [Intel XE#3468])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html
    - shard-lnl:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3184])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-7/igt@kms_pm_rpm@i2c.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1727]) +1 other test dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][26] ([Intel XE#1473] / [Intel XE#2472])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2322])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:
    - shard-bmg:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#3468]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][30] ([Intel XE#1727])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#2564]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#944])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2919] / [Intel XE#3086])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-8/igt@xe_wedged@basic-wedged.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic:
    - shard-bmg:          [INCOMPLETE][38] -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-3/igt@kms_async_flips@crc-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_async_flips@crc-atomic.html

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][40] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][41] +4 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][42] ([Intel XE#3468]) -> [PASS][43] +11 other tests pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][44] ([Intel XE#877]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][46] ([Intel XE#3468]) -> [PASS][47] +5 other tests pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_draw_crc@draw-method-mmap-wc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [DMESG-WARN][48] ([Intel XE#2705]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][50] ([Intel XE#3321]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [DMESG-WARN][52] ([Intel XE#2566] / [Intel XE#877]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@xe_exec_basic@no-exec-basic-defer-mmap:
    - shard-bmg:          [DMESG-WARN][54] -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@xe_exec_basic@no-exec-basic-defer-mmap.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_exec_basic@no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][56] ([Intel XE#3467]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][58] ([Intel XE#3184]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][60] ([Intel XE#1192]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][62] ([Intel XE#3468]) -> [DMESG-FAIL][63] ([Intel XE#3468])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][64] ([Intel XE#1231]) -> [DMESG-WARN][65] ([Intel XE#324])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-bmg:          [DMESG-WARN][66] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][67] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][68] ([Intel XE#3468]) -> [FAIL][69] ([Intel XE#2333]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [FAIL][70] ([Intel XE#2333]) -> [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#3468])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][72] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][73] ([Intel XE#3544])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][74] ([Intel XE#1473]) -> [TIMEOUT][75] ([Intel XE#1473])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][76] ([Intel XE#1473]) -> [INCOMPLETE][77] ([Intel XE#1473])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][78] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][79] ([Intel XE#3467])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-adlp:         [SKIP][80] ([Intel XE#1192]) -> [SKIP][81] ([Intel XE#455])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [DMESG-WARN][82] ([Intel XE#3467]) -> [DMESG-WARN][83] ([Intel XE#3467] / [Intel XE#3468])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@xe_module_load@many-reload.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_module_load@many-reload.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][84] ([Intel XE#2919] / [Intel XE#3468]) -> [DMESG-WARN][85] ([Intel XE#2919])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_wedged@basic-wedged.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8 -> xe-pw-142108v1

  IGT_8137: 8137
  xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8: 01f05d37bed61bd0dddb698bfb2b1fe1e973eec8
  xe-pw-142108v1: 142108v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html

--===============4734246126524893330==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use managed BO in memirq</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142108/">https://patchwork.freedesktop.org/series/142108/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_full -&gt; xe-pw-142108v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142108v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142108v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142108v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-5/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_full and xe-pw-142108v1_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142108v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_content_protection@uevent.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-7/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-5/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-4/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2564">Intel XE#2564</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-8/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-3/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-4/igt@kms_async_flips@crc-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@xe_exec_basic@no-exec-basic-defer-mmap.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_exec_basic@no-exec-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-adlp-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-2/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8/shard-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/shard-bmg-5/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8 -&gt; xe-pw-142108v1</li>
</ul>
<p>IGT_8137: 8137<br />
  xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8: 01f05d37bed61bd0dddb698bfb2b1fe1e973eec8<br />
  xe-pw-142108v1: 142108v1</p>

</body>
</html>

--===============4734246126524893330==--
