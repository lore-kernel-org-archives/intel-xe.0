Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930CC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD410E97E;
	Thu, 10 Jul 2025 21:57:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F52610E97A;
 Thu, 10 Jul 2025 21:57:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8684436343628517926=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_SR-IOV_support_for_BMG?=
 =?utf-8?q?_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 21:57:52 -0000
Message-ID: <175218467217.152706.17703440561958939705@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

--===============8684436343628517926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add SR-IOV support for BMG (rev4)
URL   : https://patchwork.freedesktop.org/series/151433/
State : failure

== Summary ==

CI Bug Log - changes from xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907_FULL -> xe-pw-151433v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151433v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151433v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151433v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-151433v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#827]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][6] -> [DMESG-FAIL][7] ([Intel XE#4543])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#3862]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#787]) +167 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][17] ([Intel XE#2705] / [Intel XE#4212])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][18] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#4494])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2244])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][26] -> [FAIL][27] ([Intel XE#3098]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#4543]) +1 other test dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301]) +3 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#656])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#5390]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#653]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#1503])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-5/igt@kms_hdr@static-swap.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#356])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#3414])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#1435])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#4459]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4837])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][49] ([Intel XE#2594])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#1392]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#288]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4943])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4915]) +22 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1173])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2284])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2284] / [Intel XE#366])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#579])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  
#### Possible fixes ####

  * igt@kms_atomic@atomic-plane-damage:
    - shard-adlp:         [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_atomic@atomic-plane-damage.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-4/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][63] ([Intel XE#4543]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][65] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][67] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#3124]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#4208] / [i915#2575]) -> [PASS][74] +7 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#4543]) -> [PASS][76] +4 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#455]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][81] ([Intel XE#2883]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-6/igt@kms_setmode@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_setmode@basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1392]) -> [PASS][84] +6 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#4208]) -> [PASS][86] +21 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_vm@invalid-extensions.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_vm@invalid-extensions.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - shard-adlp:         [DMESG-WARN][87] ([Intel XE#3868]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-3/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#4208] / [i915#2575]) -> [SKIP][90] ([Intel XE#623])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#4208]) -> [SKIP][92] ([Intel XE#316])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][94] ([Intel XE#1124])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#4208] / [i915#2575]) -> [SKIP][96] ([Intel XE#367])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#4208]) -> [SKIP][98] ([Intel XE#455] / [Intel XE#787])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#4208]) -> [SKIP][100] ([Intel XE#3442])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][101] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][102] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][103] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][104] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#4208] / [i915#2575]) -> [SKIP][106] ([Intel XE#306])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#4208] / [i915#2575]) -> [SKIP][108] ([Intel XE#308])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#4208] / [i915#2575]) -> [SKIP][110] ([Intel XE#323])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][111] ([Intel XE#4543]) -> [DMESG-WARN][112] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][113] ([Intel XE#2311]) -> [SKIP][114] ([Intel XE#2312]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4208]) -> [SKIP][116] ([Intel XE#651])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][117] ([Intel XE#5390]) -> [SKIP][118] ([Intel XE#2312]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][120] ([Intel XE#651]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][122] ([Intel XE#653])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][123] ([Intel XE#2313]) -> [SKIP][124] ([Intel XE#2312]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2312]) -> [SKIP][126] ([Intel XE#2313]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#4208]) -> [SKIP][128] ([Intel XE#653]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][129] ([Intel XE#3544]) -> [SKIP][130] ([Intel XE#3374] / [Intel XE#3544])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#4208]) -> [SKIP][132] ([Intel XE#1489])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][133] ([Intel XE#2426]) -> [FAIL][134] ([Intel XE#1729])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][135] ([Intel XE#1729]) -> [SKIP][136] ([Intel XE#362])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@vma-ufence:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#4208]) -> [SKIP][138] ([Intel XE#4837]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_eudebug@vma-ufence.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_eudebug@vma-ufence.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#4208]) -> [SKIP][140] ([Intel XE#288])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_system_allocator@twice-mmap-free:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208]) -> [SKIP][142] ([Intel XE#4915]) +24 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_exec_system_allocator@twice-mmap-free.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_exec_system_allocator@twice-mmap-free.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1061]) -> [FAIL][144] ([Intel XE#1173])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@xe_peer2peer@read.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907 -> xe-pw-151433v4

  IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907: a3d8676def9ac9edaed0a3140e566659ecb5c907
  xe-pw-151433v4: 151433v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/index.html

--===============8684436343628517926==
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
<tr><td><b>Series:</b></td><td>Add SR-IOV support for BMG (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151433/">https://patchwork.freedesktop.org/series/151433/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151433v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151433v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3389-a3d8676def9ac9edaed0a3140e566659e=
cb5c907_FULL -&gt; xe-pw-151433v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151433v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151433v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1514=
33v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-d3hot-basic-exec:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-4/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151433v4/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151433v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-8/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-3/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/s=
hard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-436/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp=
-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-ad=
lp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-5/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151433v4/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_plane_lowres@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151433v4/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_eudebug@multiple-session=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-2/igt@xe_exec_balancer@many-execque=
ues-cm-parallel-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_exec_fault_mode@once-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@xe_exec_system_allocator@once=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map-no=
memset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_exec_system_allocator@pr=
ocess-many-large-execqueues-new-bo-map-nomemset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>=
) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151433v4/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_ato=
mic@atomic-plane-damage.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/sha=
rd-adlp-4/igt@kms_atomic@atomic-plane-damage.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151433v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-d=
g2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151433v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151433v4/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-tran=
sitions.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +4 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-6/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-5/igt@kms_setmode@basic.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_vm@=
invalid-extensions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_vm@inva=
lid-extensions.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-3/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-front.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/sh=
ard-adlp-9/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a>=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
433v4/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/62=
3">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/sha=
rd-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_bw=
@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
33v4/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg=
2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2=
-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-435/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-=
433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4=
/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
433v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-d=
g2-433/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">=
Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
33v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
33v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg=
2-433/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/s=
hard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_eud=
ebug@vma-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-433/igt@xe_eudebug@vm=
a-ufence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
33v4/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-463/igt@xe_exe=
c_system_allocator@twice-mmap-free.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-43=
3/igt@xe_exec_system_allocator@twice-mmap-free.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151433v4/shard-dg2-463/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907 -&gt; xe-pw-151=
433v4</li>
</ul>
<p>IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3389-a3d8676def9ac9edaed0a3140e566659ecb5c907: a3d8676def9ac9edaed0a31=
40e566659ecb5c907<br />
  xe-pw-151433v4: 151433v4</p>

</body>
</html>

--===============8684436343628517926==--
