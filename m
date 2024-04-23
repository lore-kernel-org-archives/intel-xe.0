Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B77C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 12:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA17113345;
	Tue, 23 Apr 2024 12:07:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5F1113347;
 Tue, 23 Apr 2024 12:07:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2221548819199396777=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?Revert_=22drm/xe/vm=3A_drop_vm-=3Edestroy=5Fwork=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 12:07:09 -0000
Message-ID: <171387402905.1607645.1502976493952185622@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423074721.119633-3-matthew.auld@intel.com>
In-Reply-To: <20240423074721.119633-3-matthew.auld@intel.com>
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

--===============2221548819199396777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] Revert "drm/xe/vm: drop vm->destroy_work"
URL   : https://patchwork.freedesktop.org/series/132756/
State : success

== Summary ==

CI Bug Log - changes from xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa_full -> xe-pw-132756v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132756v1_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - {shard-lnl}:        [SKIP][1] ([Intel XE#1407]) -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - {shard-lnl}:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - {shard-lnl}:        [SKIP][6] ([Intel XE#1124]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - {shard-lnl}:        [SKIP][8] ([Intel XE#367]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - {shard-lnl}:        [SKIP][10] ([Intel XE#1399]) -> [SKIP][11] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - {shard-lnl}:        [SKIP][12] ([Intel XE#306]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_chamelium_color@degamma.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {shard-lnl}:        [SKIP][14] ([Intel XE#373]) -> [SKIP][15] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-fast.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@mei-interface:
    - {shard-lnl}:        [SKIP][16] ([Intel XE#1468]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_content_protection@mei-interface.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - {shard-lnl}:        [SKIP][18] ([Intel XE#309]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - {shard-lnl}:        [SKIP][20] ([Intel XE#1446]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - {shard-lnl}:        [SKIP][22] ([Intel XE#1421]) -> [SKIP][23] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - {shard-lnl}:        [SKIP][24] ([Intel XE#1401]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - {shard-lnl}:        [SKIP][26] ([Intel XE#656]) -> [SKIP][27] +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - {shard-lnl}:        [SKIP][28] ([Intel XE#651]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-lnl}:        [SKIP][30] ([Intel XE#1439]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - {shard-lnl}:        [SKIP][32] ([Intel XE#1406]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_psr@fbc-pr-primary-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - {shard-lnl}:        [SKIP][34] ([Intel XE#1435]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - {shard-lnl}:        [SKIP][36] ([Intel XE#362]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - {shard-lnl}:        [SKIP][38] ([Intel XE#330]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - {shard-lnl}:        [SKIP][40] ([Intel XE#756]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_writeback@writeback-invalid-parameters.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - {shard-lnl}:        [SKIP][42] ([Intel XE#688]) -> [SKIP][43] +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - {shard-lnl}:        [SKIP][44] ([Intel XE#1392]) -> [SKIP][45] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][46] -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - {shard-lnl}:        [PASS][48] -> [SKIP][49] +55 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_query@multigpu-query-engines:
    - {shard-lnl}:        [SKIP][50] ([Intel XE#944]) -> [SKIP][51] +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_query@multigpu-query-engines.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_query@multigpu-query-engines.html

  
Known issues
------------

  Here are the changes found in xe-pw-132756v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][52] ([Intel XE#1538] / [Intel XE#1689])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][53] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][54] ([Intel XE#1033] / [Intel XE#1214]) +3 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][57] ([Intel XE#1204])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#610])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#367])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1252])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#1178])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#308])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][69] -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][72] -> [DMESG-WARN][73] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#703])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][75] ([Intel XE#1214])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][77] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#650]) +55 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#616]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#656]) +12 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#417])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-adlp:         NOTRUN -> [FAIL][84] ([Intel XE#616] / [Intel XE#654]) +4 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#1201] / [Intel XE#1211])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_rmfb@close-fd@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#294])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_rmfb@close-fd@pipe-b-dp-4.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][94] ([Intel XE#1174])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][95] -> [FAIL][96] ([Intel XE#771] / [Intel XE#899])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][97] -> [FAIL][98] ([Intel XE#899])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_vrr@flipline.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][101] -> [TIMEOUT][102] ([Intel XE#1473])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html
    - shard-dg2-set2:     [PASS][104] -> [TIMEOUT][105] ([Intel XE#1473] / [Intel XE#392])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#1259])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         NOTRUN -> [FAIL][111] ([Intel XE#1396])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][113] -> [TIMEOUT][114] ([Intel XE#1261] / [Intel XE#1356])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#378])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_module_load@force-load.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][116] ([Intel XE#1221])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [FAIL][117] ([Intel XE#1043] / [Intel XE#845])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1:
    - {shard-lnl}:        [INCOMPLETE][119] -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][123] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][124] +5 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][125] ([Intel XE#616]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - {shard-lnl}:        [DMESG-WARN][127] ([Intel XE#1330]) -> [PASS][128] +9 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1088] / [Intel XE#1195]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - {shard-lnl}:        [SKIP][133] ([Intel XE#1460]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - {shard-lnl}:        [SKIP][137] ([Intel XE#1211]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_pm_rpm@i2c.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#1174]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_sysfs_edid_timing.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#771] / [Intel XE#899]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][143] ([Intel XE#899]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - {shard-lnl}:        [SKIP][145] -> [PASS][146] +5 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [DMESG-FAIL][147] ([Intel XE#482]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#1259]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][151] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-rebind:
    - shard-dg2-set2:     [TIMEOUT][153] ([Intel XE#1088] / [Intel XE#1364]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_compute_mode@many-execqueues-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-rebind.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-dg2-set2:     [TIMEOUT][159] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][161] ([Intel XE#1081]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr:
    - {shard-lnl}:        [FAIL][163] ([Intel XE#1256]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [TIMEOUT][165] ([Intel XE#1093] / [Intel XE#1206]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_module_load@many-reload.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-exec-after:
    - {shard-lnl}:        [DMESG-WARN][167] ([Intel XE#1595]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][170] ([Intel XE#1178])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_content_protection@legacy.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#1204]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#455])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][173] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#1608])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][176] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][178] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][179] ([Intel XE#1473]) -> [TIMEOUT][180] ([Intel XE#1259] / [Intel XE#1473])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#1068]) -> [DMESG-FAIL][182] ([Intel XE#1068] / [Intel XE#358])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][184] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][186] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][188] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#1214]) -> [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1358])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@xe_pm@s3-basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@xe_pm@s3-basic.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [INCOMPLETE][191] ([Intel XE#1195] / [Intel XE#1349]) -> [INCOMPLETE][192] ([Intel XE#1195])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1460
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1645
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/654
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa -> xe-pw-132756v1

  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa
  xe-pw-132756v1: 132756v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/index.html

--===============2221548819199396777==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] Revert &quot;drm/xe/vm: drop vm-&gt;destroy_work&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132756/">https://patchwork.freedesktop.org/series/132756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa_full -&gt; xe-pw-132756v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132756v1_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446">Intel XE#1446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132756v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-7-4-rc-ccs-cc-to-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +55 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_multiple@tiling-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/654">Intel XE#654</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_rmfb@close-fd@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-4/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1460">Intel XE#1460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-436/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-463/igt@xe_evict@evict-beng-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_compute_mode@many-execqueues-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364">Intel XE#1364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093">Intel XE#1093</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Intel XE#1595</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-6/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-8/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-9/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa/shard-adlp-9/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132756v1/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa -&gt; xe-pw-132756v1</li>
</ul>
<p>IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1157-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa<br />
  xe-pw-132756v1: 132756v1</p>

</body>
</html>

--===============2221548819199396777==--
