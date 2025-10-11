Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C607CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 15:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BBE10E098;
	Sat, 11 Oct 2025 15:08:34 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F04810E098;
 Sat, 11 Oct 2025 15:08:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2880934829630114831=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Wire_up_reset/postinstall_?=
 =?utf-8?q?for_I2C_IRQ_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 11 Oct 2025 15:08:32 -0000
Message-ID: <176019531262.2067.15606006872327476635@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251011123509.3233213-1-raag.jadav@intel.com>
In-Reply-To: <20251011123509.3233213-1-raag.jadav@intel.com>
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

--===============2880934829630114831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Wire up reset/postinstall for I2C IRQ (rev3)
URL   : https://patchwork.freedesktop.org/series/154993/
State : failure

== Summary ==

CI Bug Log - changes from xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c_FULL -> xe-pw-154993v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154993v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154993v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154993v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-154993v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +20 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#3862]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2291]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#1340])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#3009])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_dp_aux_dev.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#701])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2316]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][23] -> [DMESG-WARN][24] ([Intel XE#4543]) +10 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#651])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#653]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][29] -> [ABORT][30] ([Intel XE#2953]) +1 other test abort
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-2/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#5626])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4837]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][36] -> [INCOMPLETE][37] ([Intel XE#6321])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
    - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#5625]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@twice-null-rebind:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#3876])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_basic@twice-null-rebind.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_basic@twice-null-rebind.html
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#3876])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec_basic@twice-null-rebind.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_basic@twice-null-rebind.html

  * igt@xe_exec_compute_mode@many-userptr-rebind:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#5625])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_compute_mode@many-userptr-rebind.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_compute_mode@many-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#6050]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#6325])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#6325])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#4937] / [Intel XE#5625]) +22 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4915]) +13 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - shard-adlp:         [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#3876])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
    - shard-bmg:          [PASS][57] -> [DMESG-FAIL][58] ([Intel XE#3876])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-basic.html

  * igt@xe_gt_freq@freq_range_exec:
    - shard-bmg:          [PASS][59] -> [TIMEOUT][60] ([Intel XE#3876]) +1 other test timeout
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_gt_freq@freq_range_exec.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_gt_freq@freq_range_exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [PASS][61] -> [TIMEOUT][62] ([Intel XE#3876]) +2 other tests timeout
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4650])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4733])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@basic:
    - shard-adlp:         [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][66] +2 other tests pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-2/igt@kms_addfb_basic@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-4/igt@kms_addfb_basic@basic.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][67] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][71] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][73] ([Intel XE#2291]) -> [PASS][74] +8 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][75] ([Intel XE#4633]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][77] ([Intel XE#2316]) -> [PASS][78] +4 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][79] ([Intel XE#4543]) -> [PASS][80] +9 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][81] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][83] ([Intel XE#301]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][85] ([Intel XE#4543]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][87] ([Intel XE#1503]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][89] ([Intel XE#4596]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][91] ([Intel XE#6321]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
    - shard-lnl:          [FAIL][93] ([Intel XE#5625]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][97] ([Intel XE#1178]) -> [SKIP][98] ([Intel XE#2341]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_content_protection@legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][99] ([Intel XE#4543]) -> [DMESG-FAIL][100] ([Intel XE#4543])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#4543]) -> [DMESG-WARN][102] ([Intel XE#4543])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-WARN][104] ([Intel XE#5208])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][105] ([Intel XE#5208]) -> [DMESG-WARN][106] ([Intel XE#4543] / [Intel XE#5208])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][107] ([Intel XE#2312]) -> [SKIP][108] ([Intel XE#2311]) +14 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][109] ([Intel XE#2311]) -> [SKIP][110] ([Intel XE#2312]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][111] ([Intel XE#2312]) -> [SKIP][112] ([Intel XE#5390]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][113] ([Intel XE#5390]) -> [SKIP][114] ([Intel XE#2312]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][115] ([Intel XE#2313]) -> [SKIP][116] ([Intel XE#2312]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][117] ([Intel XE#2312]) -> [SKIP][118] ([Intel XE#2313]) +13 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][119] ([Intel XE#2509]) -> [SKIP][120] ([Intel XE#2426])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@d3hot-i2c:
    - shard-adlp:         [SKIP][121] ([Intel XE#5742]) -> [TIMEOUT][122] ([Intel XE#3876])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_pm@d3hot-i2c.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][123] ([Intel XE#5742]) -> [TIMEOUT][124] ([Intel XE#3876] / [Intel XE#6162])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_pm@d3hot-i2c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#6162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6162
  [Intel XE#6320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6320
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6325
  [Intel XE#6326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6326
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c -> xe-pw-154993v3

  IGT_8582: 8582
  xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c: 06e3b25f52e5d52c975ad9a04f63ddc0be033e1c
  xe-pw-154993v3: 154993v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/index.html

--===============2880934829630114831==
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
<tr><td><b>Series:</b></td><td>Wire up reset/postinstall for I2C IRQ (rev3)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154993/">https://patchwork.freedesktop.org/series/154993/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154993v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154993v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0b=
e033e1c_FULL -&gt; xe-pw-154993v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154993v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154993v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1549=
93v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_hd=
r@static-toggle-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-464/igt@kms_hdr=
@static-toggle-suspend@pipe-a-dp-4.html">INCOMPLETE</a> +1 other test incom=
plete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154993v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg=
2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2=
-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_fli=
p@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-3/igt@kms_flip@basic-=
plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_lea=
se@lease-unleased-crtc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-2/igt@kms_l=
ease@lease-unleased-crtc@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 o=
ther test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-2/igt@kms_vblank@ts-co=
ntinuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_eu_stall@unprivileged-ac=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_eudebug_online@interrupt=
-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec=
_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/=
shard-adlp-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invali=
date-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5625">Intel XE#5625</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
basic@twice-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_basic@twice-n=
ull-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec=
_basic@twice-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_basic@twice=
-null-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
compute_mode@many-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_comp=
ute_mode@many-userptr-rebind.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bm=
g-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/60=
50">Intel XE#6050</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec=
_reset@cm-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6325">Intel XE#6325</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
reset@cm-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6325">Intel XE#6325</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-malloc-bo-unmap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/ig=
t@xe_exec_system_allocator@process-many-malloc-bo-unmap.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#=
4937</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
625">Intel XE#5625</a>) +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nome=
mset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_exec=
_threads@threads-bal-shared-vm-basic.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_exec=
_threads@threads-bal-shared-vm-basic.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_exec_=
threads@threads-bal-shared-vm-basic.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_exec_t=
hreads@threads-bal-shared-vm-basic.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_gt_fr=
eq@freq_range_exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_gt_freq@freq_range_exec=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3876">Intel XE#3876</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_pm@s=
2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_pm@s2idle-exec-after.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3876">Intel XE#3876</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_pmu@fn-engine-activity-s=
ched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154993v3/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-2/igt@kms_add=
fb_basic@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-4=
/igt@kms_addfb_basic@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154993v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-154993v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-mc-ccs@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +8 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-1/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-8/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-1=
/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +9 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1549=
93v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shar=
d-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154993v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a=
-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg=
-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-lnl-1/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE=
#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154993v3/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-=
dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-3/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-=
adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-3/igt@kms_fli=
p@flip-vs-expired-vblank@c-hdmi-a1.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-=
adlp-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-1=
/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-6=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Inte=
l XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154993v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1549=
93v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v=
3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1549=
93v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154993v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154993v3/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-adlp-9/igt@xe_pm@d=
3hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5742">Intel XE#5742</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154993v3/shard-adlp-9/igt@xe_pm@d3hot-i2c.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3876">Intel XE#3876</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c/shard-bmg-5/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5742">Intel XE#5742</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154993v3/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">T=
IMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3876">Intel XE#3876</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6162">Intel XE#6162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c -&gt; xe-pw-154=
993v3</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3901-06e3b25f52e5d52c975ad9a04f63ddc0be033e1c: 06e3b25f52e5d52c975ad9a=
04f63ddc0be033e1c<br />
  xe-pw-154993v3: 154993v3</p>

</body>
</html>

--===============2880934829630114831==--
