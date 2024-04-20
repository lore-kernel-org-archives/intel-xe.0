Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AF6C4345F
	for <intel-xe@archiver.kernel.org>; Sat, 20 Apr 2024 02:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42A10E028;
	Sat, 20 Apr 2024 02:58:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C4F10E028;
 Sat, 20 Apr 2024 02:58:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6183822019805767231=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_allow_unaligned_start?=
 =?utf-8?q?_and_size_xe=5Fres=5Fcursor_parameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Apr 2024 02:58:08 -0000
Message-ID: <171358188800.1536675.17947437334626272636@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
In-Reply-To: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
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

--===============6183822019805767231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: allow unaligned start and size xe_res_cursor parameters
URL   : https://patchwork.freedesktop.org/series/132605/
State : success

== Summary ==

CI Bug Log - changes from xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba_full -> xe-pw-132605v1_full
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

  Here are the changes found in xe-pw-132605v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][1] ([Intel XE#1033] / [Intel XE#358]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][2] ([Intel XE#616]) +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#306])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#323])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#309])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#307])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#616]) +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#356])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#718])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#327])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1127] / [Intel XE#1201])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][27] -> [FAIL][28] ([Intel XE#899])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#756])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][31] -> [TIMEOUT][32] ([Intel XE#1473] / [Intel XE#402])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][33] -> [FAIL][34] ([Intel XE#1259])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#1473]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [PASS][43] -> [TIMEOUT][44] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][45] ([Intel XE#1191] / [Intel XE#1214])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#1192] / [Intel XE#1201])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#366])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#944])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][50] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][52] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][54] ([Intel XE#616]) -> [PASS][55] +2 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][56] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][58] ([Intel XE#361]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [SKIP][60] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][62] ([Intel XE#899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][64] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@xe_evict@evict-threads-large.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [TIMEOUT][68] ([Intel XE#1206] / [Intel XE#1356]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][70] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-FAIL][72] ([Intel XE#1538] / [Intel XE#1689]) -> [INCOMPLETE][73] ([Intel XE#1195])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-1/igt@core_hotunplug@hotreplug.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [ABORT][74] ([Intel XE#1689]) -> [INCOMPLETE][75] ([Intel XE#1195] / [Intel XE#1365])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][76] ([Intel XE#1204]) -> [DMESG-FAIL][77] ([Intel XE#324])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][78] ([Intel XE#324]) -> [FAIL][79] ([Intel XE#1242])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][81] ([Intel XE#1214] / [Intel XE#282])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][82] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][83] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][84] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][85] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#869]) -> [SKIP][87] ([Intel XE#1201] / [Intel XE#362])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#1041]) -> [DMESG-FAIL][89] ([Intel XE#821])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-adlp:         [DMESG-FAIL][90] ([Intel XE#1069]) -> [DMESG-FAIL][91] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [DMESG-WARN][92] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-FAIL][93] ([Intel XE#1191])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba -> xe-pw-132605v1

  IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba: 15a5d7875da5807b5bf0e5bd3ca9678f64335bba
  xe-pw-132605v1: 132605v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/index.html

--===============6183822019805767231==
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
<tr><td><b>Series:</b></td><td>drm/xe: allow unaligned start and size xe_res_cursor parameters</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132605/">https://patchwork.freedesktop.org/series/132605/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba_full -&gt; xe-pw-132605v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132605v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@xe_evict@evict-beng-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-small-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-1/igt@core_hotunplug@hotreplug.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/869">Intel XE#869</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132605v1/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba -&gt; xe-pw-132605v1</li>
</ul>
<p>IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1113-15a5d7875da5807b5bf0e5bd3ca9678f64335bba: 15a5d7875da5807b5bf0e5bd3ca9678f64335bba<br />
  xe-pw-132605v1: 132605v1</p>

</body>
</html>

--===============6183822019805767231==--
