Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73325D20691
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 02:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1B610E0D5;
	Wed, 16 Oct 2024 02:29:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256D910E0D5;
 Wed, 16 Oct 2024 02:29:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6891744042197175426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Enlarge_the_invalidat?=
 =?utf-8?q?ion_timeout_from_150_to_500_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 02:29:34 -0000
Message-ID: <172904577413.1271272.14972587816270861197@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015161207.1373401-1-shuicheng.lin@intel.com>
In-Reply-To: <20241015161207.1373401-1-shuicheng.lin@intel.com>
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

--===============6891744042197175426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enlarge the invalidation timeout from 150 to 500 (rev4)
URL   : https://patchwork.freedesktop.org/series/139805/
State : failure

== Summary ==

CI Bug Log - changes from xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full -> xe-pw-139805v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139805v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139805v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139805v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@xe_pm@s3-mocs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-FAIL][9] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - {shard-bmg}:        [PASS][13] -> [INCOMPLETE][14] +2 other tests incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html

  
New tests
---------

  New tests have been introduced between xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full and xe-pw-139805v4_full:

### New IGT tests (35) ###

  * igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@zero-clock@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@planar-pixel-format-settings:
    - Statuses : 4 pass(s)
    - Exec time: [0.04, 0.12] s

  * igt@kms_sequence@get-forked-busy@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_sequence@get-forked-busy@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_sequence@get-forked-busy@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_sequence@get-forked-busy@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.45] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@query-forked-busy@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@wait-busy@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@wait-busy@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  

Known issues
------------

  Here are the changes found in xe-pw-139805v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][18] -> [DMESG-WARN][19] ([Intel XE#877])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1477])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1428]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][25] ([Intel XE#1874]) +2 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +34 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#616]) +8 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2669]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#1195])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#314])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#314]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#373]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1424]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#308])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#2577]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#309]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#323])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#309]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#1475])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][62] ([Intel XE#1620]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1508] / [Intel XE#599])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#599])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#776])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#703])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1137])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1421]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#310]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#886]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][74] ([Intel XE#886]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1397])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][78] -> [FAIL][79] ([Intel XE#1874])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#651]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#656]) +9 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656]) +18 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1469])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#651]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#653]) +15 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1470])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][89] -> [ABORT][90] ([Intel XE#2625]) +1 other test abort
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#599])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1450]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1450] / [Intel XE#599])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2927])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][95] ([Intel XE#1035] / [Intel XE#1195])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][96] ([Intel XE#2078]) +1 other test warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format@pipe-a-plane-0:
    - shard-lnl:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2929]) +1 other test dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#324]) +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [PASS][101] -> [DMESG-FAIL][102] ([Intel XE#324]) +2 other tests dmesg-fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#361])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2763]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +10 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#870])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1129])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][110] -> [FAIL][111] ([Intel XE#718])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-59:
    - shard-lnl:          [PASS][112] -> [DMESG-FAIL][113] ([Intel XE#1620])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-lnl:          NOTRUN -> [TIMEOUT][114] ([Intel XE#1620])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1489]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1489]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2893]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1406]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#2948]) +3 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#327]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#362])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#330])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#899]) +2 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#455]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#2443]) +2 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#756]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1123])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#2667])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-idle.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-idle.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#2905]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2905]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2905]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#688]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1392]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1392]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [PASS][141] -> [FAIL][142] ([Intel XE#2754])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#288]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#288]) +10 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#2360])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-adlp:         [PASS][146] -> [INCOMPLETE][147] ([Intel XE#1169] / [Intel XE#1195])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@xe_exec_threads@threads-mixed-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-6/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2833])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2541])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][150] ([Intel XE#2249])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][151] ([Intel XE#2514])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2541]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#2284] / [Intel XE#366])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2284] / [Intel XE#366])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][155] -> [ABORT][156] ([Intel XE#1694])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][157] -> [ABORT][158] ([Intel XE#1694] / [Intel XE#1794])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#584])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][160] -> [ABORT][161] ([Intel XE#1358] / [Intel XE#1607])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][162] -> [ABORT][163] ([Intel XE#1358] / [Intel XE#1607])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@xe_pm@s4-exec-after.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          [PASS][164] -> [FAIL][165] ([Intel XE#2968]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#958])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#944])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#944])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][171] ([Intel XE#324]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][175] ([Intel XE#2351]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][177] ([Intel XE#2436]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][179] -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_color@ctm-0-75:
    - shard-adlp:         [DMESG-WARN][181] ([Intel XE#3086]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_color@ctm-0-75.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][183] ([Intel XE#877]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [FAIL][185] ([Intel XE#1475]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][187] ([Intel XE#1475]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][189] -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][191] ([Intel XE#886]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - {shard-bmg}:        [FAIL][193] ([Intel XE#301]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#1195]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][199] ([Intel XE#1874]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [SKIP][201] ([Intel XE#2423]) -> [PASS][202] +6 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][203] ([Intel XE#324]) -> [PASS][204] +2 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [DMESG-WARN][205] ([Intel XE#324]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_cursor@overlay:
    - shard-adlp:         [DMESG-WARN][207] -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_plane_cursor@overlay.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [FAIL][209] ([Intel XE#1471] / [Intel XE#1874]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - shard-lnl:          [FAIL][211] ([Intel XE#1874]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html

  * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
    - shard-lnl:          [FAIL][213] ([Intel XE#1471]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][215] ([Intel XE#361]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-adlp:         [DMESG-WARN][217] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][219] ([Intel XE#1430]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [DMESG-FAIL][221] ([Intel XE#1620]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [FAIL][223] ([Intel XE#2948]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@xe_create@create-contexts:
    - shard-adlp:         [TIMEOUT][225] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][226] +6 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@xe_create@create-contexts.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@xe_create@create-contexts.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - shard-lnl:          [INCOMPLETE][227] -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][229] ([Intel XE#1473]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][231] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-rebind:
    - shard-lnl:          [TIMEOUT][233] -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [DMESG-WARN][235] ([Intel XE#1620]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][237] ([Intel XE#1358]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][239] ([Intel XE#1794]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [ABORT][241] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@large-split-binds-2097152:
    - shard-lnl:          [SKIP][243] ([Intel XE#1130]) -> [PASS][244] +20 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_vm@large-split-binds-2097152.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_vm@large-split-binds-2097152.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          [SKIP][245] ([Intel XE#2423]) -> [SKIP][246] ([Intel XE#873])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [DMESG-WARN][247] ([Intel XE#1725]) -> [DMESG-FAIL][248] ([Intel XE#1725])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [TIMEOUT][249] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][250] ([Intel XE#1874])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][251] ([Intel XE#1231]) -> [DMESG-FAIL][252] ([Intel XE#324]) +1 other test dmesg-fail
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          [SKIP][253] ([Intel XE#2423]) -> [SKIP][254] ([Intel XE#1512])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [TIMEOUT][255] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][256] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1727]) -> [INCOMPLETE][258] ([Intel XE#1195])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          [SKIP][259] ([Intel XE#2423]) -> [SKIP][260] ([Intel XE#373]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          [SKIP][261] ([Intel XE#2423]) -> [SKIP][262] ([Intel XE#599])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_content_protection@lic-type-0.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          [SKIP][263] ([Intel XE#2423]) -> [SKIP][264] ([Intel XE#309])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          [SKIP][265] ([Intel XE#2423]) -> [SKIP][266] ([Intel XE#1421])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][267] ([Intel XE#2351]) -> [SKIP][268] ([Intel XE#1397] / [Intel XE#1745])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-lnl:          [SKIP][269] ([Intel XE#2351]) -> [SKIP][270] ([Intel XE#651]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [TIMEOUT][271] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][272] ([Intel XE#1861])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][273] ([Intel XE#2351]) -> [SKIP][274] ([Intel XE#656]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [TIMEOUT][275] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][276] ([Intel XE#651])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          [SKIP][277] ([Intel XE#2423]) -> [SKIP][278] ([Intel XE#2763])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][279] ([Intel XE#734]) -> [FAIL][280] ([Intel XE#1204])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [INCOMPLETE][281] ([Intel XE#1620] / [Intel XE#2864]) -> [TIMEOUT][282] ([Intel XE#1620])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [DMESG-WARN][283] ([Intel XE#2042]) -> [INCOMPLETE][284] ([Intel XE#1620] / [Intel XE#2864])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][285] ([Intel XE#2351]) -> [SKIP][286] ([Intel XE#2893])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          [SKIP][287] ([Intel XE#2351]) -> [SKIP][288] ([Intel XE#1406])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [SKIP][289] ([Intel XE#2423]) -> [FAIL][290] ([Intel XE#2443])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_vrr@flip-dpms.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug@basic-read-event:
    - shard-lnl:          [SKIP][291] ([Intel XE#1130]) -> [SKIP][292] ([Intel XE#2905]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_eudebug@basic-read-event.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][293] ([Intel XE#1473]) -> [FAIL][294] ([Intel XE#1000])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          [SKIP][295] ([Intel XE#1130]) -> [SKIP][296] ([Intel XE#584])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_pm@s3-exec-after.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_pm@s3-exec-after.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2968]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2968
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 -> xe-pw-139805v4

  IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823
  xe-pw-139805v4: 139805v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/index.html

--===============6891744042197175426==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enlarge the invalidation timeout from 150 to 500 (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139805/">https://patchwork.freedesktop.org/series/139805/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full -&gt; xe-pw-139805v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139805v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139805v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139805v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@async-flip-with-page-flip-events:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full and xe-pw-139805v4_full:</p>
<h3>New IGT tests (35)</h3>
<ul>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.04, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139805v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-68.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_evict@evict-beng-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-6/igt@xe_exec_threads@threads-mixed-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-2/igt@xe_pm_residency@idle-residency-on-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2968">Intel XE#2968</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_color@ctm-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_color@ctm-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_plane_cursor@overlay.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_plane_cursor@overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_plane_cursor@primary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-contexts:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@xe_create@create-contexts.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@xe_create@create-contexts.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-bmg-4/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2097152:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_vm@large-split-binds-2097152.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_vm@large-split-binds-2097152.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-4/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v4/shard-lnl-6/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 -&gt; xe-pw-139805v4</li>
</ul>
<p>IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823<br />
  xe-pw-139805v4: 139805v4</p>

</body>
</html>

--===============6891744042197175426==--
