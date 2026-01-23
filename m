Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA59D6CFB0
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 02:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15EC10EB0B;
	Fri, 23 Jan 2026 02:00:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B00E10EB0B;
 Fri, 23 Jan 2026 02:00:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5520875333341378406=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/cdclk=3A_Extend_W?=
 =?utf-8?q?a=5F13012396614_to_Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 02:00:05 -0000
Message-ID: <176913360503.185863.14064763047729832279@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122-wa_13012396614-xe3p_lpd-v1-1-39d34a3a5b77@intel.com>
In-Reply-To: <20260122-wa_13012396614-xe3p_lpd-v1-1-39d34a3a5b77@intel.com>
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

--===============5520875333341378406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: Extend Wa_13012396614 to Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/160488/
State : failure

== Summary ==

CI Bug Log - changes from xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c_FULL -> xe-pw-160488v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160488v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160488v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160488v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-7/igt@xe_render_copy@render-stress-4-copies.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_render_copy@render-stress-4-copies.html

  
Known issues
------------

  Here are the changes found in xe-pw-160488v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#5354])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@fill-fb:
    - shard-bmg:          [PASS][9] -> [ABORT][10] ([Intel XE#5545])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-2/igt@kms_draw_crc@fill-fb.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#5545])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#2029])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][17] -> [INCOMPLETE][18] ([Intel XE#6321])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_compute_mode@twice-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#6703]) +125 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch.html

  
#### Possible fixes ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][23] ([Intel XE#4459]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [DMESG-WARN][25] ([Intel XE#7023]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][27] ([Intel XE#5625]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][29] ([Intel XE#1124]) -> [SKIP][30] ([Intel XE#6703]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][31] ([Intel XE#367]) -> [SKIP][32] ([Intel XE#6703]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][33] ([Intel XE#3432]) -> [SKIP][34] ([Intel XE#6703])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][35] ([Intel XE#2887]) -> [SKIP][36] ([Intel XE#6703]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][37] ([Intel XE#2325]) -> [SKIP][38] ([Intel XE#6703])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_chamelium_color@ctm-0-50.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          [SKIP][39] ([Intel XE#2252]) -> [SKIP][40] ([Intel XE#6703]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][41] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][42] ([Intel XE#6703])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_content_protection@legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][43] ([Intel XE#2320]) -> [SKIP][44] ([Intel XE#6703]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][45] ([Intel XE#4354]) -> [SKIP][46] ([Intel XE#6703])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][47] ([Intel XE#2244]) -> [SKIP][48] ([Intel XE#6703])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#4141]) -> [SKIP][50] ([Intel XE#6703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][51] ([Intel XE#7061]) -> [SKIP][52] ([Intel XE#6703])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][53] ([Intel XE#2311]) -> [SKIP][54] ([Intel XE#6703]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][55] ([Intel XE#2313]) -> [INCOMPLETE][56] ([Intel XE#2594])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] ([Intel XE#6703]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][59] ([Intel XE#2393]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][61] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][62] ([Intel XE#6693])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][63] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][64] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][65] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][66] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_psr@fbc-pr-primary-page-flip.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][67] ([Intel XE#2330]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][69] ([Intel XE#6503]) -> [SKIP][70] ([Intel XE#6703])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          [SKIP][71] ([Intel XE#2322]) -> [SKIP][72] ([Intel XE#6703]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][73] -> [SKIP][74] ([Intel XE#6703]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:
    - shard-bmg:          [SKIP][75] ([Intel XE#6874]) -> [SKIP][76] ([Intel XE#6703]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][77] ([Intel XE#4943]) -> [SKIP][78] ([Intel XE#6703]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][79] ([Intel XE#944]) -> [SKIP][80] ([Intel XE#6703])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c -> xe-pw-160488v1

  IGT_8712: 8712
  xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c: 2efdbb79ed20bfabfbe6f2e5cc393d85973d567c
  xe-pw-160488v1: 160488v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html

--===============5520875333341378406==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: Extend Wa_13012396614 to Xe3p_LPD</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160488/">https://patchwork.freedesktop.org/series/160488/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c_FULL -&gt; xe-pw-160488v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160488v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160488v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160488v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-dp2.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-7/igt@xe_render_copy@render-stress-4-copies.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_render_copy@render-stress-4-copies.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160488v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-2/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_draw_crc@fill-fb.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_compute_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +125 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160488v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c -&gt; xe-pw-160488v1</li>
</ul>
<p>IGT_8712: 8712<br />
  xe-4434-2efdbb79ed20bfabfbe6f2e5cc393d85973d567c: 2efdbb79ed20bfabfbe6f2e5cc393d85973d567c<br />
  xe-pw-160488v1: 160488v1</p>

</body>
</html>

--===============5520875333341378406==--
