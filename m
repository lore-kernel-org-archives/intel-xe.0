Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F26C3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 18:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5001510E0A4;
	Fri,  2 May 2025 18:13:17 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66F10E02B;
 Fri,  2 May 2025 18:13:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5217842438673448169=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/ttm=3A_Fix_ttm=5Fbacku?=
 =?utf-8?q?p_kerneldoc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 18:13:16 -0000
Message-ID: <174620959615.36564.11374260017355532420@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502130101.3185-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250502130101.3185-1-thomas.hellstrom@linux.intel.com>
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

--===============5217842438673448169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Fix ttm_backup kerneldoc
URL   : https://patchwork.freedesktop.org/series/148551/
State : failure

== Summary ==

CI Bug Log - changes from xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2_FULL -> xe-pw-148551v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148551v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148551v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148551v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@munmap-style-unbind-many-all:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +35 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_vm@munmap-style-unbind-many-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_vm@munmap-style-unbind-many-all.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][3] ([Intel XE#316]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         [SKIP][5] ([Intel XE#1124]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][7] ([Intel XE#2191]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][9] ([Intel XE#2907]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][11] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         [SKIP][13] ([Intel XE#306]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][15] ([Intel XE#373]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][17] ([Intel XE#455]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][19] ([Intel XE#656]) -> [SKIP][20] +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-adlp:         [SKIP][21] ([Intel XE#653]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         [SKIP][23] ([Intel XE#1489]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-adlp:         [SKIP][25] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr@psr2-primary-page-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         [SKIP][27] ([Intel XE#455] / [Intel XE#488]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_ccs@suspend-resume.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         [SKIP][29] ([Intel XE#4497]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_eu_stall@blocking-read.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-adlp:         [SKIP][31] ([Intel XE#4837]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_eudebug@basic-vm-access-userptr.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][33] ([Intel XE#1392]) -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][35] ([Intel XE#288]) -> [SKIP][36] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:
    - shard-adlp:         [SKIP][37] ([Intel XE#4915]) -> [SKIP][38] +23 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy.html

  * igt@xe_oa@short-reads:
    - shard-adlp:         [SKIP][39] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_oa@short-reads.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_oa@short-reads.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         [SKIP][41] ([Intel XE#944]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck}:
    - shard-adlp:         [SKIP][43] ([Intel XE#4915]) -> [SKIP][44] +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html

  
Known issues
------------

  Here are the changes found in xe-pw-148551v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1125])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#4543])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#316])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2327])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1124]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#4543])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1124])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1124]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#2191]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#2191]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2887]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#787]) +167 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#4928]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#787]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#2907])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#373]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2252]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#1178]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#1178]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2320])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2321])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#308]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#3428]) +5 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#309]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2291])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2291]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#323])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#455]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#4422])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#776])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1135])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2316]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][87] -> [FAIL][88] ([Intel XE#301]) +5 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#310]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#2316]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#301])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#301]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][96] -> [INCOMPLETE][97] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][98] ([Intel XE#2049] / [Intel XE#2597])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2293] / [Intel XE#2380])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2293])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#651]) +10 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2311]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2312]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4141])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-adlp:         [PASS][105] -> [SKIP][106] ([Intel XE#2351])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#651]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2313]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#653]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +10 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#656]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#1503]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#3012])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#4596])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#2571])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#870])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1489]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1489])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1489]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1122])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2234])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][130] -> [SKIP][131] ([Intel XE#1435])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1499])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#2168])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#756])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1123])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1126])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1126])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4837]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4837]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4837]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#261] / [Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#688])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1392])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1392]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#288]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#288]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2360])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][150] ([Intel XE#3868])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4943]) +6 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4915]) +57 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#4915]) +37 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#586])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#378])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180]) -> ([PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [SKIP][203], [PASS][204], [PASS][205], [PASS][206]) ([Intel XE#378])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#2541] / [Intel XE#3573])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_oa@buffer-fill.html
    - shard-lnl:          [PASS][208] -> [FAIL][209] ([Intel XE#4565]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-5/igt@xe_oa@buffer-fill.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-7/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2236])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#1061])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][214] -> [ABORT][215] ([Intel XE#1794]) +1 other test abort
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][216] -> [ABORT][217] ([Intel XE#1794]) +1 other test abort
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][218] -> [FAIL][219] ([Intel XE#4817]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][220] ([Intel XE#4733])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#4733])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#4733])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#944])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#4130]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#4130])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#4543]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#367]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][230] ([Intel XE#3862]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][232] ([Intel XE#3862]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][234] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][236] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#3124]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][240] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-bmg:          [SKIP][242] -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][244] ([Intel XE#2291]) -> [PASS][245] +7 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][246] ([Intel XE#2316]) -> [PASS][247] +5 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][248] ([Intel XE#3321]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][250] ([Intel XE#301]) -> [PASS][251] +1 other test pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][252] ([Intel XE#301]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][254] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][256] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [FAIL][258] ([Intel XE#4426]) -> [PASS][259] +1 other test pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_hdr@static-swap.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][260] ([Intel XE#1503]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][262] ([Intel XE#3012]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [FAIL][264] ([Intel XE#4936]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_pm_rpm@drm-resources-equal.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1392]) -> [PASS][267] +8 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:
    - shard-bmg:          [DMESG-WARN][268] ([Intel XE#3428]) -> [PASS][269] +2 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][270] -> [PASS][271] +1 other test pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][272], [SKIP][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297]) ([Intel XE#378]) -> ([PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-2/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-2/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-2/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-8/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-8/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-8/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [TIMEOUT][323] -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-1/igt@xe_oa@oa-exponents.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-2/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][325] ([Intel XE#1794]) -> [PASS][326] +1 other test pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [FAIL][327] -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][329] ([Intel XE#1178]) -> [SKIP][330] ([Intel XE#2341])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_content_protection@atomic.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][331] ([Intel XE#2341]) -> [FAIL][332] ([Intel XE#1178]) +1 other test fail
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][333] ([Intel XE#1188]) -> [SKIP][334] ([Intel XE#2341])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_content_protection@uevent.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][335] ([Intel XE#3321]) -> [SKIP][336] ([Intel XE#2316])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][337] ([Intel XE#651]) -> [SKIP][338] ([Intel XE#2351])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][339] ([Intel XE#2312]) -> [SKIP][340] ([Intel XE#2311]) +12 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][341] ([Intel XE#656]) -> [SKIP][342] ([Intel XE#2351])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][343] ([Intel XE#2312]) -> [SKIP][344] ([Intel XE#4141]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][345] ([Intel XE#4141]) -> [SKIP][346] ([Intel XE#2312]) +16 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][347] ([Intel XE#2311]) -> [SKIP][348] ([Intel XE#2312]) +23 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][349] ([Intel XE#2313]) -> [SKIP][350] ([Intel XE#2312]) +22 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][351] ([Intel XE#2312]) -> [SKIP][352] ([Intel XE#2313]) +11 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][353] ([Intel XE#4596]) -> [SKIP][354] ([Intel XE#2493])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][355] ([Intel XE#2493]) -> [SKIP][356] ([Intel XE#4596])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         [SKIP][357] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][358] ([Intel XE#2351])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][359] ([Intel XE#2426]) -> [SKIP][360] ([Intel XE#2509])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         [INCOMPLETE][361] ([Intel XE#4911]) -> [TIMEOUT][362] ([Intel XE#4911])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][363] ([Intel XE#1173]) -> [SKIP][364] ([Intel XE#1061])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_peer2peer@write.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4928
  [Intel XE#4936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4936
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2 -> xe-pw-148551v1

  IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2: 5303c0e49b49fe27639ba8b2c178931bc22344a2
  xe-pw-148551v1: 148551v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/index.html

--===============5217842438673448169==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Fix ttm_backup kerneldoc</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148551/">https://patchwork.freedesktop.org/series/148551/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148551v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148551v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3026-5303c0e49b49fe27639ba8b2c178931bc=
22344a2_FULL -&gt; xe-pw-148551v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148551v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148551v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1485=
51v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-many-all:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_vm@m=
unmap-style-unbind-many-all.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_vm@munmap-sty=
le-unbind-many-all.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_big=
_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_=
big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_bw@=
connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/s=
hard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_ccs=
@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3=
/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148551v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_cha=
melium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms=
_chamelium_color@ctm-blue-to-red.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_cha=
melium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/i=
gt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_dir=
tyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551=
v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@kms=
_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr=
2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1=
/shard-adlp-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.ht=
ml">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr=
@psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-=
3/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_ccs@=
suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_cc=
s@suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_eu_s=
tall@blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_eu_stall=
@blocking-read.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_eude=
bug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe=
_eudebug@basic-vm-access-userptr.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8551v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-i=
nvalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
88">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bi=
ndexecqueue-userptr-invalidate-race-imm.html">SKIP</a> +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec=
_system_allocator@many-large-execqueues-malloc-busy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
51v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-execqueues-malloc=
-busy.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_oa@s=
hort-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_oa=
@short-reads.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck}:<u=
l>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_exec=
_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#=
4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148551v1/shard-adlp-3/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dont=
unmap-eocheck.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148551v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp=
-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4928">Intel XE#4928</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_content_protection@lega=
cy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-=
movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x64.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +5 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vb=
lank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148551v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-in=
terruptible@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@=
kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@kms_psr@psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_vrr@flip-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-dis=
covery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_eudebug@sysfs-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_evict@evict-large-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_exec_basic@multigpu-no-ex=
ec-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_fault_mode@many-bind=
execqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_exec_system_allocator@many=
-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_exec_system_allocator@ma=
ny-large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +57 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_exec_system_allocator@man=
y-stride-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +37 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc2=
2344a2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178=
931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba=
8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe2=
7639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49=
b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-530=
3c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-30=
26-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc223=
44a2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c17893=
1bc22344a2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2=
c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe2763=
9ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49=
fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0=
e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-=
5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48551v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148551v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148551v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_oa@buffer-fill.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-5/igt@xe_oa@bu=
ffer-fill.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148551v1/shard-lnl-7/igt@xe_oa@buffer-fill.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565">Intel X=
E#4565</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_peer2peer@read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-6/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148551v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817"=
>Intel XE#4817</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148551v1/shard-adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sh=
ard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard=
-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148551v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48551v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148551v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_curs=
or_edge_walk@256x256-left-edge.html">SKIP</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_cursor_edg=
e_walk@256x256-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +7 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg=
-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-lnl-1/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
51v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@kms_fl=
ip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel =
XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148551v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-434/igt@kms_hd=
r@static-swap.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4426">Intel XE#4426</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-436/igt@kms_hdr@static-=
swap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-1/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_pm_r=
pm@drm-resources-equal.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4936">Intel XE#4936</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg=
2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +8 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@xe_exec_=
system_allocator@many-stride-mmap-shared-nomemset.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#=
3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148551v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-mmap-shared-n=
omemset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148551v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a=
2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc2=
2344a2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c1789=
31bc22344a2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2=
c178931bc22344a2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639=
ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe=
27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49=
b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303=
c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026=
-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a=
2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c178931bc2=
2344a2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2c1789=
31bc22344a2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639ba8b2=
c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe27639=
ba8b2c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3026-5303c0e49b49fe=
27639ba8b2c178931bc22344a2/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
51v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148551v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148551v1/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551=
v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48551v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148551v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-lnl-1/igt@xe_oa@oa=
-exponents.html">TIMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148551v1/shard-lnl-2/igt@xe_oa@oa-exponents.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-6/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_vm@=
bind-array-enobufs.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_vm@bind-array-enobufs=
.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-7/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551=
v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148551v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551=
v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1485=
51v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148551v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48551v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148551v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@kms_psr=
@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-adlp-=
3/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148551v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-adlp-4/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4=
911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48551v1/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send=
_recv.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2/shard-dg2-464/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148551v1/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2 -&gt; xe-pw-148=
551v1</li>
</ul>
<p>IGT_8351: a994944173f1428dcf7247af03a821d51feae1cc @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3026-5303c0e49b49fe27639ba8b2c178931bc22344a2: 5303c0e49b49fe27639ba8b=
2c178931bc22344a2<br />
  xe-pw-148551v1: 148551v1</p>

</body>
</html>

--===============5217842438673448169==--
