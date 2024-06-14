Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA69DC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 14:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CDC10ED5F;
	Fri, 14 Jun 2024 14:00:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE310ED55;
 Fri, 14 Jun 2024 14:00:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3536647458435419981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_Explicitly_cast_to_u6?=
 =?utf-8?q?4_to_avoid_overflow_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 14:00:47 -0000
Message-ID: <171837364795.77189.9768918837301395482@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614062415.260340-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240614062415.260340-1-zbigniew.kempczynski@intel.com>
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

--===============3536647458435419981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Explicitly cast to u64 to avoid overflow (rev2)
URL   : https://patchwork.freedesktop.org/series/134869/
State : success

== Summary ==

CI Bug Log - changes from xe-1464-a88e8dc2c59464cac89137471031d736a408652f_full -> xe-pw-134869v2_full
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

  Here are the unknown changes that may have been introduced in xe-pw-134869v2_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-134869v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] ([Intel XE#1033] / [Intel XE#1214])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#1874])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - shard-adlp:         [PASS][10] -> [ABORT][11] ([Intel XE#1205] / [Intel XE#1553])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip.html

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][12] -> [ABORT][13] ([Intel XE#1205])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#1553])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1195]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-433/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-463/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214]) +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][22] -> [ABORT][23] ([Intel XE#1794])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-8/igt@xe_pm@s4-mocs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-9/igt@xe_pm@s4-mocs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][24] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][26] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-lnl}:        [FAIL][28] ([Intel XE#1659]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][31] +3 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - {shard-lnl}:        [DMESG-WARN][32] -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][34] ([Intel XE#1874]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][36] ([Intel XE#1214]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][38] ([Intel XE#361]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-adlp:         [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#1727]) -> [PASS][41] +3 other tests pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_prop_blob@blob-prop-lifetime.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][42] ([Intel XE#771] / [Intel XE#899]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][44] ([Intel XE#899]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][46] ([Intel XE#1473]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][48] ([Intel XE#1069]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - {shard-lnl}:        [INCOMPLETE][50] -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-8/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-adlp:         [DMESG-WARN][52] ([Intel XE#1214]) -> [PASS][53] +4 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][54] ([Intel XE#1622]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][56] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][57] ([Intel XE#1214])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-move@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#282]) -> [INCOMPLETE][61] ([Intel XE#1195]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-434/igt@kms_cursor_legacy@forked-move@all-pipes.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@all-pipes.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][62] ([Intel XE#1214]) -> [DMESG-WARN][63] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][64] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][65] ([Intel XE#1729])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-FAIL][66] ([Intel XE#1760]) -> [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#1760])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1464-a88e8dc2c59464cac89137471031d736a408652f -> xe-pw-134869v2

  IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1464-a88e8dc2c59464cac89137471031d736a408652f: a88e8dc2c59464cac89137471031d736a408652f
  xe-pw-134869v2: 134869v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/index.html

--===============3536647458435419981==
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
<tr><td><b>Series:</b></td><td>drm/xe: Explicitly cast to u64 to avoid overflow (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134869/">https://patchwork.freedesktop.org/series/134869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1464-a88e8dc2c59464cac89137471031d736a408652f_full -&gt; xe-pw-134869v2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134869v2_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@flip-vs-suspend:<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134869v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-1/igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553">Intel XE#1553</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-433/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-463/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-lifetime:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@kms_prop_blob@blob-prop-lifetime.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_prop_blob@blob-prop-lifetime.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-4/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-8/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-lnl-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel XE#1622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-434/igt@kms_cursor_legacy@forked-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@all-pipes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1464-a88e8dc2c59464cac89137471031d736a408652f/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134869v2/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1464-a88e8dc2c59464cac89137471031d736a408652f -&gt; xe-pw-134869v2</li>
</ul>
<p>IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1464-a88e8dc2c59464cac89137471031d736a408652f: a88e8dc2c59464cac89137471031d736a408652f<br />
  xe-pw-134869v2: 134869v2</p>

</body>
</html>

--===============3536647458435419981==--
