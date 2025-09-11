Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1334BCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 23:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B4410E3FD;
	Thu, 11 Sep 2025 23:37:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9BA10E3FB;
 Thu, 11 Sep 2025 23:37:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2449167120262342894=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS94ZTogVXNlIHBvbGxfdGlt?=
 =?utf-8?b?ZW91dF91cygpIChyZXY0KQ==?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 23:37:16 -0000
Message-ID: <175763383668.327980.9711228340916444653@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
In-Reply-To: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
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

--===============2449167120262342894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use poll_timeout_us() (rev4)
URL   : https://patchwork.freedesktop.org/series/153671/
State : failure

== Summary ==

CI Bug Log - changes from xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8_FULL -> xe-pw-153671v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153671v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153671v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153671v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@xe_pm@d3hot-mmap-vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:
    - shard-bmg:          NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html

  * {igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  
Known issues
------------

  Here are the changes found in xe-pw-153671v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2291]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#4633])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#776])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2316]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2293]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1874]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#4543]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#5390]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#651]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#653]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2934])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#5020])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1406] / [Intel XE#1489])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#1489])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3414] / [Intel XE#3904])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4837]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-race:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4837]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_eudebug@discovery-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2322])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1392])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#288]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4915]) +22 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4943]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#3573])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#977])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4733])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4733])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][49] ([Intel XE#4543]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][51] ([Intel XE#2291]) -> [PASS][52] +1 other test pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][53] ([Intel XE#2316]) -> [PASS][54] +4 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][55] ([Intel XE#1435]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][57] ([Intel XE#3876]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-adlp:         [DMESG-FAIL][59] ([Intel XE#3876]) -> [PASS][60] +2 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [FAIL][61] ([Intel XE#5507]) -> [PASS][62] +1 other test pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-2/igt@xe_pat@pat-index-xe2.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@xe_pat@pat-index-xe2.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][63] ([Intel XE#5390]) -> [SKIP][64] ([Intel XE#2312]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][65] ([Intel XE#2312]) -> [SKIP][66] ([Intel XE#5390]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][67] ([Intel XE#2312]) -> [SKIP][68] ([Intel XE#2311]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][69] ([Intel XE#2311]) -> [SKIP][70] ([Intel XE#2312]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][71] ([Intel XE#2312]) -> [SKIP][72] ([Intel XE#2313]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][73] ([Intel XE#2313]) -> [SKIP][74] ([Intel XE#2312]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [ABORT][75] -> [ABORT][76] ([Intel XE#2953])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8 -> xe-pw-153671v4

  IGT_8535: 8535
  xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8: 6383690b59fb31f52a5932aab3a9963265e86fc8
  xe-pw-153671v4: 153671v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html

--===============2449167120262342894==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use poll_timeout_us() (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153671/">https://patchwork.freedesktop.org/series/153671/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8_FULL -&gt; xe-pw-153671v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153671v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153671v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153671v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@xe_pm@d3hot-mmap-vram.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153671v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_exec_system_allocator@many-large-execqueues-mmap-file-mlock-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-dg2-432/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-2/igt@xe_pat@pat-index-xe2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@xe_pat@pat-index-xe2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/shard-adlp-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/shard-adlp-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8 -&gt; xe-pw-153671v4</li>
</ul>
<p>IGT_8535: 8535<br />
  xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8: 6383690b59fb31f52a5932aab3a9963265e86fc8<br />
  xe-pw-153671v4: 153671v4</p>

</body>
</html>

--===============2449167120262342894==--
