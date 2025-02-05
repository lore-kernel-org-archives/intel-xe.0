Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA219C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 14:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51110E172;
	Wed,  5 Feb 2025 14:26:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CF610E172;
 Wed,  5 Feb 2025 14:26:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6188742386643826215=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Expose_modifiers/formats_s?=
 =?utf-8?q?upported_by_async_flips_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 14:26:43 -0000
Message-ID: <173876560357.1463076.11825744576729213552@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
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

--===============6188742386643826215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose modifiers/formats supported by async flips (rev3)
URL   : https://patchwork.freedesktop.org/series/140934/
State : failure

== Summary ==

CI Bug Log - changes from xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba_full -> xe-pw-140934v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140934v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140934v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140934v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +3 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_force_connector_basic@force-edid.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-adlp:         [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-3/igt@kms_properties@get_properties-sanity-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_properties@get_properties-sanity-non-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-bmg:          [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_properties@get_properties-sanity-non-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_properties@get_properties-sanity-non-atomic.html
    - shard-lnl:          [PASS][12] -> [FAIL][13] +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-6/igt@kms_properties@get_properties-sanity-non-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-8/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][14] -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  
New tests
---------

  New tests have been introduced between xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba_full and xe-pw-140934v3_full:

### New IGT tests (8) ###

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-43:
    - Statuses : 4 pass(s)
    - Exec time: [2.71, 17.36] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-53:
    - Statuses : 4 pass(s)
    - Exec time: [2.66, 17.56] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-63:
    - Statuses : 4 pass(s)
    - Exec time: [2.68, 17.42] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
    - Statuses : 4 pass(s)
    - Exec time: [2.70, 17.79] s

  * igt@kms_pm_rpm@legacy-planes@plane-43:
    - Statuses : 4 pass(s)
    - Exec time: [1.57, 17.48] s

  * igt@kms_pm_rpm@legacy-planes@plane-53:
    - Statuses : 4 pass(s)
    - Exec time: [1.56, 17.60] s

  * igt@kms_pm_rpm@legacy-planes@plane-63:
    - Statuses : 4 pass(s)
    - Exec time: [1.56, 17.38] s

  * igt@kms_pm_rpm@legacy-planes@plane-73:
    - Statuses : 4 pass(s)
    - Exec time: [1.56, 17.52] s

  

Known issues
------------

  Here are the changes found in xe-pw-140934v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#827]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#877])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][20] ([Intel XE#877])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][21] ([Intel XE#4172]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3862]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#787]) +125 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#3304])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-bo@pipe-d:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#3226]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@pipe-d.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@pipe-d.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2316]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#3098]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#886]) +5 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#4208] / [i915#2575]) +113 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_flip@busy-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#3321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#301])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#4208]) +229 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#651])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-lnl:          [PASS][59] -> [INCOMPLETE][60] ([Intel XE#2050])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#653])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#656]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4208] / [i915#2575]) +16 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#616]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4113]) +1 other test dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-435/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2763]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_psr@pr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2850] / [Intel XE#929])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_psr@pr-primary-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1127])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#1435])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@query-idle-hang@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][73] ([Intel XE#1033]) +11 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_vblank@query-idle-hang@pipe-d-dp-4.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-bmg:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1473] / [Intel XE#4172])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@xe_evict@evict-small-external-cm.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_basic@many-execqueues-userptr-invalidate:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#3868])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@xe_exec_basic@many-execqueues-userptr-invalidate.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-3/igt@xe_exec_basic@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4208]) +71 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-bal-userptr:
    - shard-bmg:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#4172]) +3 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@xe_exec_threads@threads-bal-userptr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@xe_exec_threads@threads-bal-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#4173]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2953])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-6/igt@xe_module_load@many-reload.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-9/igt@xe_module_load@many-reload.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2541] / [Intel XE#3573])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait-cfg.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@core_getversion@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@core_getversion@basic.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#2134]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@fbdev@write.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][92] +14 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][93] ([Intel XE#1033]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][95] ([Intel XE#4172]) -> [PASS][96] +20 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][97] ([Intel XE#2291]) -> [PASS][98] +4 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][99] ([Intel XE#3009]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_dp_aux_dev.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#301]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][103] ([Intel XE#2316]) -> [PASS][104] +3 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][105] ([Intel XE#3321]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [FAIL][109] ([Intel XE#2882]) -> [PASS][110] +3 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#4208] / [i915#2575]) -> [PASS][112] +90 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_lease@invalid-create-leases.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_lease@invalid-create-leases.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][113] ([Intel XE#899]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4208]) -> [PASS][116] +231 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#2134]) -> [DMESG-WARN][118] ([Intel XE#1033])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@fbdev@info.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@fbdev@info.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#4208] / [i915#2575]) -> [SKIP][120] ([Intel XE#623])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#873]) -> [SKIP][122] ([Intel XE#4208] / [i915#2575])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#4208] / [i915#2575]) -> [SKIP][124] ([Intel XE#3768])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][126] ([Intel XE#1033]) +12 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][128] ([Intel XE#316])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#4208]) -> [SKIP][130] ([Intel XE#316]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#316]) -> [SKIP][132] ([Intel XE#4208]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#316]) -> [SKIP][134] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1124]) -> [SKIP][136] ([Intel XE#4208]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][138] ([Intel XE#1124]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][140] ([Intel XE#619]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1124]) -> [SKIP][142] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#4208]) -> [SKIP][144] ([Intel XE#1124]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#4208] / [i915#2575]) -> [SKIP][146] ([Intel XE#2191])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2191]) -> [SKIP][148] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#4208] / [i915#2575]) -> [SKIP][150] ([Intel XE#367]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#367]) -> [SKIP][152] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][154] ([Intel XE#4208]) +15 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#4208]) -> [SKIP][156] ([Intel XE#2907]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][158] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#3442]) -> [SKIP][160] ([Intel XE#4208]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2907]) -> [SKIP][162] ([Intel XE#4208]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][165] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [SKIP][166] ([Intel XE#2351] / [Intel XE#4208])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#4208]) -> [SKIP][168] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#373]) -> [SKIP][170] ([Intel XE#4208] / [i915#2575]) +14 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#306]) -> [SKIP][172] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208] / [i915#2575]) -> [SKIP][174] ([Intel XE#306]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208] / [i915#2575]) -> [SKIP][176] ([Intel XE#373]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#307]) -> [SKIP][178] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#4208] / [i915#2575]) -> [SKIP][180] ([Intel XE#307])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208] / [i915#2575]) -> [FAIL][182] ([Intel XE#1178]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#4208] / [i915#2575]) -> [SKIP][184] ([Intel XE#308]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#308]) -> [SKIP][186] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][187] ([Intel XE#877]) -> [SKIP][188] ([Intel XE#2291])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][189] ([Intel XE#2291]) -> [DMESG-WARN][190] ([Intel XE#877])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][191] ([Intel XE#2291]) -> [DMESG-WARN][192] ([Intel XE#4172]) +1 other test dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208] / [i915#2575]) -> [SKIP][194] ([Intel XE#323]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][196] ([Intel XE#455])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_dsc@dsc-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#455]) -> [SKIP][198] ([Intel XE#4208]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#455]) -> [SKIP][200] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208]) -> [SKIP][202] ([Intel XE#776])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#4208] / [i915#2575]) -> [SKIP][204] ([Intel XE#703])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#4208] / [i915#2575]) -> [SKIP][206] ([Intel XE#1135])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_feature_discovery@psr2.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][207] ([Intel XE#2316]) -> [DMESG-WARN][208] ([Intel XE#4172])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#4172]) -> [SKIP][210] ([Intel XE#2316])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#4208] / [i915#2575]) -> [FAIL][212] ([Intel XE#301])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#4172]) -> [INCOMPLETE][214] ([Intel XE#2049] / [Intel XE#2597])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4208]) -> [SKIP][216] ([Intel XE#455]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2351] / [Intel XE#4208]) -> [DMESG-WARN][218] ([Intel XE#1033])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2311]) +20 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#2311]) -> [SKIP][222] ([Intel XE#2312]) +20 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#4208]) -> [SKIP][224] ([Intel XE#651]) +29 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#651]) -> [SKIP][226] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][228] ([Intel XE#651]) +12 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [DMESG-WARN][230] ([Intel XE#1033]) +6 other tests dmesg-warn
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][231] ([Intel XE#4141]) -> [SKIP][232] ([Intel XE#2312]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][233] ([Intel XE#2312]) -> [SKIP][234] ([Intel XE#4141]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#651]) -> [SKIP][236] ([Intel XE#4208]) +21 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#653]) -> [SKIP][238] ([Intel XE#4208]) +27 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][240] ([Intel XE#653]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#653]) -> [SKIP][242] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][244] ([Intel XE#658])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#4208]) -> [SKIP][246] ([Intel XE#653]) +31 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][247] ([Intel XE#2313]) -> [SKIP][248] ([Intel XE#2312]) +14 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][249] ([Intel XE#2312]) -> [SKIP][250] ([Intel XE#2313]) +17 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][251] ([Intel XE#3544]) -> [SKIP][252] ([Intel XE#3374] / [Intel XE#3544])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#4208]) -> [SKIP][254] ([Intel XE#346])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208]) -> [SKIP][256] ([Intel XE#2927])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2925]) -> [SKIP][258] ([Intel XE#4208])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#4208] / [i915#2575]) -> [SKIP][260] ([Intel XE#356])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [FAIL][261] ([Intel XE#616]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_plane_cursor@overlay.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208] / [i915#2575]) -> [DMESG-FAIL][264] ([Intel XE#1033])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_cursor@primary.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][266] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#4208] / [i915#2575]) -> [SKIP][268] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][270] ([Intel XE#1033] / [Intel XE#2566])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#870])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1122]) -> [SKIP][274] ([Intel XE#2351] / [Intel XE#4208])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1129]) -> [SKIP][276] ([Intel XE#4208])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#3309]) -> [SKIP][278] ([Intel XE#4208])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#4208]) -> [SKIP][280] ([Intel XE#1489]) +11 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1489]) -> [SKIP][282] ([Intel XE#4208]) +9 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1122]) -> [SKIP][284] ([Intel XE#4208])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#1122])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][288] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][290] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][292] ([Intel XE#4208]) +14 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208]) -> [SKIP][294] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2939]) -> [SKIP][296] ([Intel XE#2351] / [Intel XE#4208])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#3414]) -> [SKIP][298] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208] / [i915#2575]) -> [SKIP][300] ([Intel XE#3414]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208] / [i915#2575]) -> [SKIP][302] ([Intel XE#1127])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4208] / [i915#2575]) -> [SKIP][304] ([Intel XE#455]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][305] ([Intel XE#1729]) -> [SKIP][306] ([Intel XE#2426])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4208] / [i915#2575]) -> [SKIP][308] ([Intel XE#362])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1500]) -> [SKIP][310] ([Intel XE#4208] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2168]) -> [SKIP][312] ([Intel XE#4208] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_vrr@cmrr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#455]) -> [SKIP][314] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_vrr@flip-dpms.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208] / [i915#2575]) -> [SKIP][316] ([Intel XE#756])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#756]) -> [SKIP][318] ([Intel XE#4208] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][319] ([Intel XE#4212]) -> [DMESG-WARN][320] ([Intel XE#2705] / [Intel XE#4212])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@testdisplay.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-435/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#1123]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1126]) -> [SKIP][326] ([Intel XE#4208])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#2905]) +13 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_eudebug@basic-close.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2905]) -> [SKIP][330] ([Intel XE#4208]) +10 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#288]) +33 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#288]) -> [SKIP][334] ([Intel XE#4208]) +34 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208]) -> [SKIP][336] ([Intel XE#2360]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#255]) -> [SKIP][338] ([Intel XE#4208])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#560]) -> [SKIP][340] ([Intel XE#4208])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][342] ([Intel XE#4208]) +10 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#4208]) -> [SKIP][344] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208]) -> [SKIP][346] ([Intel XE#2838] / [Intel XE#979])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][347] ([Intel XE#1173]) -> [SKIP][348] ([Intel XE#1061] / [Intel XE#4208])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_peer2peer@read.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208]) -> [SKIP][350] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][352] ([Intel XE#4208]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208]) -> [DMESG-WARN][354] ([Intel XE#1033] / [Intel XE#569])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@s3-exec-after.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [ABORT][355] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#4172]) -> [ABORT][356] ([Intel XE#1358] / [Intel XE#1607])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@xe_pm@s4-exec-after.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@xe_pm@s4-exec-after.html
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [ABORT][358] ([Intel XE#1033] / [Intel XE#1358])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@s4-exec-after.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [DMESG-WARN][359] ([Intel XE#1033]) -> [SKIP][360] ([Intel XE#4208])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_pm_residency@cpg-basic.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208]) -> [SKIP][362] ([Intel XE#944]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#944]) -> [SKIP][364] ([Intel XE#4208]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208]) -> [SKIP][366] ([Intel XE#4130]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][367] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][368] ([Intel XE#4208])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba -> xe-pw-140934v3

  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba: fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba
  xe-pw-140934v3: 140934v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/index.html

--===============6188742386643826215==
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
<tr><td><b>Series:</b></td><td>Expose modifiers/formats supported by async flips (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140934/">https://patchwork.freedesktop.org/series/140934/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba_full -&gt; xe-pw-140934v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140934v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140934v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140934v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-3/igt@kms_properties@get_properties-sanity-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_properties@get_properties-sanity-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_properties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@kms_properties@get_properties-sanity-non-atomic.html">DMESG-FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_properties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_properties@get_properties-sanity-non-atomic.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-6/igt@kms_properties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-8/igt@kms_properties@get_properties-sanity-non-atomic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba_full and xe-pw-140934v3_full:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-43:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.71, 17.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-53:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.66, 17.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-63:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.68, 17.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-73:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.70, 17.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-43:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.57, 17.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-53:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.56, 17.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-63:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.56, 17.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-73:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.56, 17.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140934v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-linear.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@pipe-d.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +113 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +229 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_getfb@getfb2-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-435/igt@kms_plane_lowres@tiling-x@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113">Intel XE#4113</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_vblank@query-idle-hang@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@xe_evict@evict-small-external-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@xe_evict@evict-small-external-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@xe_exec_basic@many-execqueues-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-3/igt@xe_exec_basic@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-2/igt@xe_exec_threads@threads-bal-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@xe_exec_threads@threads-bal-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-6/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-9/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@fbdev@write.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_lease@invalid-create-leases.html">PASS</a> +90 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> +231 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@fbdev@info.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_plane_cursor@overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_cursor@primary.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-463/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-435/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-bmg-1/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-bmg-6/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_pm@s4-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v3/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba -&gt; xe-pw-140934v3</li>
</ul>
<p>IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2599-fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba: fd5c164b23df5c8efdcaef9eb40b56ec3350f6ba<br />
  xe-pw-140934v3: 140934v3</p>

</body>
</html>

--===============6188742386643826215==--
