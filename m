Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35090C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 22:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94210EC04;
	Fri, 21 Jun 2024 22:26:07 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1A310E091;
 Fri, 21 Jun 2024 22:26:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7838606846287090982=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_drm/xe=3A_Get_XE=5FFORCEWAKE=5F?=
 =?utf-8?q?ALL_to_read_RING=5FTIMESTAMP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 22:26:06 -0000
Message-ID: <171900876608.132113.10485409945387565792@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
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

--===============7838606846287090982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
URL   : https://patchwork.freedesktop.org/series/135196/
State : success

== Summary ==

CI Bug Log - changes from xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a_full -> xe-pw-135196v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135196v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] ([Intel XE#282]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#455])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8] ([Intel XE#1195]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#1874]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][11] -> [TIMEOUT][12] ([Intel XE#1473] / [Intel XE#392])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][13] -> [TIMEOUT][14] ([Intel XE#1473])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1195]) +2 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1414])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][19] -> [ABORT][20] ([Intel XE#1794]) +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#958])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][24] +3 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [DMESG-WARN][25] ([Intel XE#282]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-lnl}:        [DMESG-WARN][27] ([Intel XE#2052]) -> [PASS][28] +2 other tests pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][29] ([Intel XE#1874]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - {shard-lnl}:        [FAIL][31] ([Intel XE#899]) -> [PASS][32] +1 other test pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][33] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_pm@s4-mocs:
    - {shard-lnl}:        [ABORT][35] ([Intel XE#1794]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - {shard-lnl}:        [FAIL][37] ([Intel XE#958]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-16777216:
    - shard-dg2-set2:     [DMESG-WARN][39] ([Intel XE#1214]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_vm@large-userptr-split-misaligned-binds-16777216.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_vm@large-userptr-split-misaligned-binds-16777216.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][41] ([Intel XE#623]) -> [SKIP][42] ([Intel XE#1201] / [Intel XE#623])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#316]) -> [SKIP][44] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][46] ([Intel XE#316]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][47] ([Intel XE#324]) -> [FAIL][48] ([Intel XE#1231])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][49] ([Intel XE#610]) -> [SKIP][50] ([Intel XE#1201] / [Intel XE#610]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][52] ([Intel XE#1124]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][53] ([Intel XE#607]) -> [SKIP][54] ([Intel XE#1201] / [Intel XE#607])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][55] ([Intel XE#1124]) -> [SKIP][56] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#346]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#346])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][60] ([Intel XE#367]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#367]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][64] ([Intel XE#787]) +62 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][68] ([Intel XE#1252]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#787]) -> [SKIP][70] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][72] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#306]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#306])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][76] ([Intel XE#306]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][78] ([Intel XE#373]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#373]) -> [SKIP][80] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#307]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][84] ([Intel XE#308])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#308]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#308])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][88] ([Intel XE#282]) +6 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#282]) -> [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][92] ([Intel XE#323]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#776]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#776])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#701]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#701])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][98] ([Intel XE#1135])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_feature_discovery@psr2.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][100] ([Intel XE#455]) +15 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [i915#5274]) -> [SKIP][102] ([i915#5274])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][104] ([Intel XE#651]) +21 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#651]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#653]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#653]) +30 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][110] ([Intel XE#653]) +20 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][112] ([Intel XE#417])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#305]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#305]) +8 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#455]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#455]) +17 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#870]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#870])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#908]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#908])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][124] ([Intel XE#1122])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#929]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#929]) +18 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][128] ([Intel XE#929]) +12 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][130] ([Intel XE#1149])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#327]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][134] ([Intel XE#327]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#330]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#330])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1551]) -> [DMESG-WARN][138] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#756]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#756])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][142] ([Intel XE#1091])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1123]) -> [SKIP][144] ([Intel XE#1123] / [Intel XE#1201])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1126]) -> [SKIP][146] ([Intel XE#1126] / [Intel XE#1201])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][148] ([Intel XE#288]) +17 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#288]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][152] ([Intel XE#560])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_media_fill@media-fill.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][154] ([Intel XE#512])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_mmap@small-bar.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#378]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#378])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#979]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#979])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][160] ([Intel XE#366])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#366]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#366])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][163] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941]) -> [DMESG-WARN][164] ([Intel XE#1162] / [Intel XE#1941])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#944]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][168] ([Intel XE#944]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a -> xe-pw-135196v1

  IGT_7895: 7895
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a
  xe-pw-135196v1: 135196v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html

--===============7838606846287090982==
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
<tr><td><b>Series:</b></td><td>drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135196/">https://patchwork.freedesktop.org/series/135196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a_full -&gt; xe-pw-135196v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135196v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052">Intel XE#2052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-16777216:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_vm@large-userptr-split-misaligned-binds-16777216.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_vm@large-userptr-split-misaligned-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a -&gt; xe-pw-135196v1</li>
</ul>
<p>IGT_7895: 7895<br />
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a<br />
  xe-pw-135196v1: 135196v1</p>

</body>
</html>

--===============7838606846287090982==--
