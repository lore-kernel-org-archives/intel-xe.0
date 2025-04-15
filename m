Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF645C369BD
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 17:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C8C10E131;
	Tue, 15 Apr 2025 17:29:32 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CAD10E131;
 Tue, 15 Apr 2025 17:29:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6804150214171814384=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915=3A_i915=5Freg=2Eh?=
 =?utf-8?q?_display_split_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 17:29:31 -0000
Message-ID: <174473817123.7729.17268734167934968168@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744714233.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744714233.git.jani.nikula@intel.com>
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

--===============6804150214171814384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: i915_reg.h display split (rev2)
URL   : https://patchwork.freedesktop.org/series/144506/
State : failure

== Summary ==

CI Bug Log - changes from xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65_FULL -> xe-pw-144506v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144506v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144506v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144506v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-bmg:          ([PASS][1], [PASS][2]) -> [DMESG-FAIL][3]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-bmg:          ([PASS][4], [PASS][5]) -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     ([PASS][7], [PASS][8]) -> [FAIL][9]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_pmu@gt-frequency.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs:
    - shard-lnl:          ([PASS][10], [FAIL][11]) -> [FAIL][12] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-6/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@gt-frequency@gt0}:
    - shard-dg2-set2:     ([PASS][13], [PASS][14]) -> [FAIL][15]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_pmu@gt-frequency@gt0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_pmu@gt-frequency@gt0.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_pmu@gt-frequency@gt0.html

  
Known issues
------------

  Here are the changes found in xe-pw-144506v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#911]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +81 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#4212])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     ([PASS][24], [PASS][25]) -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     ([PASS][27], [PASS][28]) -> [INCOMPLETE][29] ([Intel XE#2705] / [Intel XE#4212])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          ([PASS][36], [PASS][37]) -> [SKIP][38] ([Intel XE#2291]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#323])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#3226])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     ([PASS][42], [PASS][43]) -> [SKIP][44] ([Intel XE#309]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          ([PASS][45], [PASS][46]) -> [SKIP][47] ([Intel XE#2373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          ([PASS][48], [PASS][49]) -> [SKIP][50] ([Intel XE#2316]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     ([PASS][51], [PASS][52]) -> [SKIP][53] ([Intel XE#310]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          ([PASS][54], [PASS][55]) -> [FAIL][56] ([Intel XE#886]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          ([PASS][57], [PASS][58]) -> [FAIL][59] ([Intel XE#3321]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     ([PASS][60], [PASS][61]) -> [FAIL][62] ([Intel XE#301]) +2 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     ([PASS][63], [PASS][64]) -> [FAIL][65] ([Intel XE#301] / [Intel XE#3321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#2882]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     ([PASS][68], [PASS][69]) -> [SKIP][70] ([Intel XE#656]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#658])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#653]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_hdr@static-swap.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     ([PASS][78], [PASS][79]) -> [SKIP][80] ([Intel XE#4328])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     ([PASS][81], [PASS][82]) -> [SKIP][83] ([Intel XE#4596])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          ([PASS][84], [PASS][85]) -> [SKIP][86] ([Intel XE#4596])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     ([PASS][87], [PASS][88]) -> [SKIP][89] ([Intel XE#836])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          ([PASS][90], [PASS][91]) -> [DMESG-WARN][92] ([Intel XE#3428])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_pm_rpm@system-suspend-modeset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1489])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1489])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2234] / [Intel XE#2850])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2939])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][98], [PASS][99]) -> [FAIL][100] ([Intel XE#2883]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     ([PASS][101], [PASS][102]) -> [SKIP][103] ([Intel XE#455])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          ([PASS][104], [PASS][105]) -> [SKIP][106] ([Intel XE#1435])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#756])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2905] / [Intel XE#3889])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2905]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     ([PASS][110], [PASS][111]) -> [SKIP][112] ([Intel XE#1392]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#1392]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#288]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#560])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2541] / [Intel XE#3573])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_oa@disabled-read-error.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3428]) +7 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@xe_pm_residency@cpg-basic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4733])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4733])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][123], [DMESG-FAIL][124]) ([Intel XE#4543]) -> [PASS][125] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     ([PASS][126], [SKIP][127]) ([Intel XE#2191]) -> [PASS][128]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [SKIP][129] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     ([PASS][131], [INCOMPLETE][132]) ([Intel XE#3862]) -> [PASS][133]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          ([SKIP][134], [PASS][135]) ([Intel XE#2291]) -> [PASS][136] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][137] ([Intel XE#2291]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#309]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     ([SKIP][141], [PASS][142]) ([Intel XE#309]) -> [PASS][143] +4 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][144] ([Intel XE#1340]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          ([PASS][146], [SKIP][147]) ([Intel XE#4354]) -> [PASS][148]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     ([FAIL][149], [PASS][150]) ([Intel XE#4164]) -> [PASS][151]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_fbcon_fbt@fbc-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][152] ([Intel XE#3321]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     ([SKIP][154], [PASS][155]) ([Intel XE#310]) -> [PASS][156] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          ([SKIP][157], [PASS][158]) ([Intel XE#2316]) -> [PASS][159] +3 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#310]) -> [PASS][161] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][162] ([Intel XE#2316]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-adlp:         [FAIL][164] ([Intel XE#2882]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@kms_flip@blocking-wf_vblank.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         ([PASS][166], [FAIL][167]) ([Intel XE#2882]) -> [PASS][168]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          ([PASS][169], [FAIL][170]) ([Intel XE#2882]) -> [PASS][171] +2 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     ([PASS][172], [FAIL][173]) ([Intel XE#301]) -> [PASS][174] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     ([PASS][175], [FAIL][176]) ([Intel XE#301] / [Intel XE#3321]) -> [PASS][177]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     ([FAIL][178], [FAIL][179]) ([Intel XE#301] / [Intel XE#3321]) -> [PASS][180]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     ([FAIL][181], [FAIL][182]) ([Intel XE#301]) -> [PASS][183]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     ([PASS][184], [INCOMPLETE][185]) ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][186]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     ([INCOMPLETE][187], [INCOMPLETE][188]) ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][189] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          ([FAIL][190], [FAIL][191]) ([Intel XE#886]) -> [PASS][192] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - shard-lnl:          ([FAIL][193], [PASS][194]) ([Intel XE#886]) -> [PASS][195]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#656]) -> [PASS][197] +4 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     ([SKIP][198], [PASS][199]) ([Intel XE#656]) -> [PASS][200] +4 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     ([SKIP][201], [SKIP][202]) ([Intel XE#455]) -> [PASS][203]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][204] ([Intel XE#1503]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          ([SKIP][206], [PASS][207]) ([Intel XE#3012]) -> [PASS][208]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     ([FAIL][209], [PASS][210]) ([Intel XE#4741]) -> [PASS][211]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#836]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-bmg:          ([PASS][214], [DMESG-WARN][215]) ([Intel XE#3428]) -> [PASS][216] +2 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     ([SKIP][217], [PASS][218]) ([Intel XE#836]) -> [PASS][219]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         ([PASS][220], [DMESG-WARN][221]) ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][222] +2 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          ([FAIL][223], [PASS][224]) ([Intel XE#4459]) -> [PASS][225] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     ([PASS][226], [SKIP][227]) ([Intel XE#1392]) -> [PASS][228] +6 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][229] ([Intel XE#3428]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         ([PASS][231], [DMESG-WARN][232]) ([Intel XE#4173]) -> [PASS][233] +6 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [SKIP][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281]) ([Intel XE#378]) -> ([PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-fill@rcs-0:
    - shard-lnl:          ([FAIL][307], [PASS][308]) ([Intel XE#4565]) -> [PASS][309] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@xe_oa@buffer-fill@rcs-0.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@xe_oa@buffer-fill@rcs-0.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-8/igt@xe_oa@buffer-fill@rcs-0.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          ([ABORT][310], [PASS][311]) ([Intel XE#1794]) -> [PASS][312]
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         ([ABORT][313], [PASS][314]) ([Intel XE#1794]) -> [PASS][315]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         ([DMESG-FAIL][316], [DMESG-FAIL][317]) ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][318] ([Intel XE#4543])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][319], [SKIP][320]) ([Intel XE#787]) -> [SKIP][321] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][323] ([Intel XE#787]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#787]) -> [SKIP][325] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][326], [SKIP][327]) ([Intel XE#455] / [Intel XE#787]) -> [SKIP][328] ([Intel XE#787]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     ([INCOMPLETE][329], [PASS][330]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][331] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     ([PASS][332], [INCOMPLETE][333]) ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][334] ([Intel XE#2705] / [Intel XE#4212])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     ([SKIP][335], [SKIP][336]) ([Intel XE#4418]) -> [SKIP][337] ([Intel XE#4440])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#455]) -> [FAIL][339] ([Intel XE#1178])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_content_protection@atomic.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     ([SKIP][340], [FAIL][341]) ([Intel XE#1178] / [Intel XE#455]) -> [FAIL][342] ([Intel XE#1178])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_content_protection@legacy.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_content_protection@legacy.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [TIMEOUT][343] -> [FAIL][344] ([Intel XE#1178]) +1 other test fail
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     ([FAIL][345], [FAIL][346]) ([Intel XE#1178]) -> [SKIP][347] ([Intel XE#455])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_content_protection@srm.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_content_protection@srm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     ([FAIL][348], [FAIL][349]) ([Intel XE#1188]) -> [SKIP][350] ([Intel XE#455])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_content_protection@uevent.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_content_protection@uevent.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          ([PASS][351], [SKIP][352]) ([Intel XE#2291]) -> [SKIP][353] ([Intel XE#2291]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     ([FAIL][354], [PASS][355]) ([Intel XE#301]) -> [SKIP][356] ([Intel XE#310])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          ([PASS][357], [SKIP][358]) ([Intel XE#2316]) -> [SKIP][359] ([Intel XE#2316]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     ([PASS][360], [FAIL][361]) ([Intel XE#301]) -> [FAIL][362] ([Intel XE#301]) +3 other tests fail
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     ([PASS][363], [FAIL][364]) ([Intel XE#301] / [Intel XE#3321]) -> [FAIL][365] ([Intel XE#301] / [Intel XE#3321])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          ([SKIP][366], [SKIP][367]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][368] ([Intel XE#2311]) +5 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][369], [SKIP][370]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][371] ([Intel XE#2312]) +8 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     ([SKIP][372], [SKIP][373]) ([Intel XE#651]) -> [SKIP][374] ([Intel XE#656]) +17 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][375] ([Intel XE#2311]) -> [SKIP][376] ([Intel XE#2312])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][377] ([Intel XE#2312]) -> [SKIP][378] ([Intel XE#2311]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     ([SKIP][379], [SKIP][380]) ([Intel XE#651] / [Intel XE#656]) -> [SKIP][381] ([Intel XE#651]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][382], [SKIP][383]) ([Intel XE#2312] / [Intel XE#4141]) -> [SKIP][384] ([Intel XE#4141]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          ([SKIP][385], [SKIP][386]) ([Intel XE#2312] / [Intel XE#4141]) -> [SKIP][387] ([Intel XE#2312]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][388], [SKIP][389]) ([Intel XE#4141]) -> [SKIP][390] ([Intel XE#2312]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][391] ([Intel XE#2312]) -> [SKIP][392] ([Intel XE#4141]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][393], [SKIP][394]) ([Intel XE#2311]) -> [SKIP][395] ([Intel XE#2312]) +7 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#656]) -> [SKIP][397] ([Intel XE#651]) +8 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][398], [SKIP][399]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][400] ([Intel XE#2312]) +7 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          ([SKIP][401], [SKIP][402]) ([Intel XE#2313]) -> [SKIP][403] ([Intel XE#2312]) +6 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     ([SKIP][404], [SKIP][405]) ([Intel XE#653]) -> [SKIP][406] ([Intel XE#656]) +16 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][407] ([Intel XE#2312]) -> [SKIP][408] ([Intel XE#2313]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#656]) -> [SKIP][410] ([Intel XE#653]) +7 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     ([SKIP][411], [SKIP][412]) ([Intel XE#653] / [Intel XE#656]) -> [SKIP][413] ([Intel XE#653]) +10 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][414], [SKIP][415]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][416] ([Intel XE#2313]) +4 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     ([FAIL][417], [FAIL][418]) ([Intel XE#1729]) -> [SKIP][419] ([Intel XE#362])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][420], [SKIP][421]) ([Intel XE#1500] / [Intel XE#362]) -> [SKIP][422] ([Intel XE#1500])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     ([PASS][423], [SKIP][424]) ([Intel XE#1392]) -> [SKIP][425] ([Intel XE#1392]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:
    - shard-lnl:          ([PASS][426], [ABORT][427]) ([Intel XE#4624]) -> [ABORT][428] ([Intel XE#4624]) +1 other test abort
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-6/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         ([PASS][429], [DMESG-WARN][430]) ([Intel XE#4173]) -> [DMESG-WARN][431] ([Intel XE#4173])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     ([PASS][432], [FAIL][433]) ([Intel XE#1999]) -> [FAIL][434] ([Intel XE#1999]) +2 other tests fail
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][435] ([Intel XE#1173]) -> [SKIP][436] ([Intel XE#1061])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_peer2peer@read.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     ([FAIL][437], [FAIL][438]) ([Intel XE#1173]) -> [SKIP][439] ([Intel XE#1061])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_peer2peer@write.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_peer2peer@write.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         ([PASS][440], [ABORT][441]) ([Intel XE#1794]) -> [ABORT][442] ([Intel XE#1794])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65 -> xe-pw-144506v2

  IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65: 4e52f6bddf99cb28ed0279d56bb8286a8bbfda65
  xe-pw-144506v2: 144506v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/index.html

--===============6804150214171814384==
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
<tr><td><b>Series:</b></td><td>drm/i915: i915_reg.h display split (rev2)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144506/">https://patchwork.freedesktop.org/series/144506/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144506v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8=
bbfda65_FULL -&gt; xe-pw-144506v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144506v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144506v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1445=
06v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d5=
6bb8286a8bbfda65/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-=
events-atomic.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cur=
sor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8=
286a8bbfda65/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transi=
tions.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomi=
c-transitions.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_pm=
u@gt-frequency.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt=
@xe_pmu@gt-frequency.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_pmu@gt-frequency.h=
tml">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs:<=
ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@xe_exec=
_queue_property@timeslice_duration_us-property-min-max@rcs.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb=
28ed0279d56bb8286a8bbfda65/shard-lnl-6/igt@xe_exec_queue_property@timeslice=
_duration_us-property-min-max@rcs.html">FAIL</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@xe_exec_qu=
eue_property@timeslice_duration_us-property-min-max@rcs.html">FAIL</a> +1 o=
ther test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@gt-frequency@gt0}:<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_pm=
u@gt-frequency@gt0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464=
/igt@xe_pmu@gt-frequency@gt0.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_pmu@gt-fre=
quency@gt0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144506v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-=
linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-linear.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
506v2/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events-atom=
ic@pipe-b-dp-2-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +81 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bb=
fda65/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PA=
SS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4506v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed02=
79d56bb8286a8bbfda65/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs-cc@pipe-b-dp-4.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_ccs@random-ccs-d=
ata-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_content_protection@atom=
ic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_cur=
sor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a=
8bbfda65/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.ht=
ml">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144506v2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shar=
d-lnl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d5=
6bb8286a8bbfda65/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-atomi=
c-transitions.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_fea=
ture_discovery@display-2x.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-=
bmg-2/igt@kms_feature_discovery@display-2x.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@k=
ms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_fli=
p@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb=
8286a8bbfda65/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interr=
uptible.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
lip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sh=
ard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2=
-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@kms_fli=
p@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfd=
a65/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506=
v2/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Inte=
l XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8b=
bfda65/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">=
PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56b=
b8286a8bbfda65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@a-dp4.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
lip@flip-vs-expired-vblank@a-dp4.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">=
Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_flip=
@wf_vblank-ts-check-interruptible@c-dp2.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-3/igt@kms_f=
lip@wf_vblank-ts-check-interruptible@c-dp2.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-indfb-draw-blt.html">PASS</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sha=
rd-dg2-432/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-4=
64/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_p=
lane_multiple@2x-tiling-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-=
dg2-463/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt=
@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-none.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard=
-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/ig=
t@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_p=
m_rpm@modeset-non-lpsp.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2=
-463/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_p=
m_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_pm_=
rpm@system-suspend-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard=
-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/ig=
t@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_psr@psr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_s=
etmode@basic@pipe-a-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sha=
rd-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-4=
34/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_s=
etmode@clone-exclusive-crtc.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shar=
d-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464=
/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_set=
mode@invalid-clone-single-crtc-stealing.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8=
bbfda65/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html=
">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144506v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_writeback@writeback-che=
ck-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_eudebug@discovery-empty.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_ex=
ec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb=
28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-basic-defer-mmap.html">PASS</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#=
1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalida=
te-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_exec_fault_mode@once-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_oa@disabled-read-error.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@xe_pm_re=
sidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@xe_pm_residency@cpg-basic.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3428">Intel XE#3428</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_query@multigpu-query-inv=
alid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb=
28ed0279d56bb8286a8bbfda65/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-=
adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip=
.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_b=
w@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56=
bb8286a8bbfda65/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays=
-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@kms_bw@connected=
-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144506v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_c=
cs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286=
a8bbfda65/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.=
html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_ccs@crc-primary-su=
spend-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99c=
b28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-atomic-transitions-varying-size.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-=
2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-b=
mg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144506v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tra=
nsitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbf=
da65/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">=
Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144506v2/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_dp_=
link_training@non-uhbr-sst.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard=
-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/s=
hard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_f=
bcon_fbt@fbc-suspend.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-4=
34/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4164">Intel XE#4164</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436=
/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_f=
lip@2x-modeset-vs-vblank-race.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sh=
ard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506=
v2/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fli=
p@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286=
a8bbfda65/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-=
race-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_fl=
ip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/=
igt@kms_flip@2x-nonexisting-fb-interruptible.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_flip@2x-plai=
n-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@kms_fli=
p@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-1/igt@kms_flip@=
blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-8/igt@kms_fl=
ip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/=
shard-adlp-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#=
2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sha=
rd-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1445=
06v2/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56b=
b8286a8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@d-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-exp=
ired-vblank-interruptible@d-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
lip@flip-vs-expired-vblank@c-dp4.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-=
dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_f=
lip@flip-vs-expired-vblank@d-dp4.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-=
dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
lip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbf=
da65/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a=
6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_f=
lip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-43=
2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1445=
06v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_f=
lip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8=
bbfda65/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCO=
MPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286=
a8bbfda65/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144506v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-inte=
rruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@b-edp1.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286=
a8bbfda65/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144506v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-inte=
rruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506=
v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-ono=
ff.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_f=
rontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb=
28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">P=
ASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_h=
dr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt=
@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@kms_hdr@i=
nvalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_joi=
ner@invalid-modeset-force-big-joiner.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbf=
da65/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012"=
>Intel XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144506v2/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joi=
ner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_p=
m_rpm@basic-pci-d3-state.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-d=
g2-433/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard=
-dg2-432/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_pm=
_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_pm_rpm@d=
pms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_pm_=
rpm@legacy-planes-dpms@plane-68.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/=
shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html">DMESG-WARN</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Int=
el XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144506v2/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html"=
>PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_p=
m_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bb=
fda65/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-=
wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-6/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/sha=
rd-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#=
2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.=
html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-6/igt@kms_vrr=
@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/i=
gt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@k=
ms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_ex=
ec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bin=
dexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe=
_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> +6=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@xe_exec_=
threads@threads-hang-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/s=
hard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@xe_fau=
lt_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d5=
6bb8286a8bbfda65/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_vm_c=
reate_scratch.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-3/igt@xe_fault_=
injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> +6 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8b=
bfda65/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8=
286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed027=
9d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb2=
8ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bdd=
f99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e5=
2f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
53-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbf=
da65/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb828=
6a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d5=
6bb8286a8bbfda65/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99=
cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6=
bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-=
4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shar=
d-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda6=
5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8=
bbfda65/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb=
8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed027=
9d56bb8286a8bbfda65/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb2=
8ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bdd=
f99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e5=
2f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
53-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbf=
da65/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb828=
6a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d5=
6bb8286a8bbfda65/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99=
cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6=
bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44506v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144506v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144506v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@xe_oa@b=
uffer-fill@rcs-0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt=
@xe_oa@buffer-fill@rcs-0.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4565">Intel XE#4565</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-8/igt@xe_oa=
@buffer-fill@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-2/igt@xe_pm@s=
4-mocs.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-5/igt@xe_pm@s4=
-mocs.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/igt@xe_pm@=
s4-vm-bind-prefetch.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-=
8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-1/i=
gt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99=
cb28ed0279d56bb8286a8bbfda65/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
506v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-as=
ync-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_c=
cs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28e=
d0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-g=
en12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@km=
s_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144506v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-r=
c-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506=
v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-=
6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_c=
cs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-=
tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-=
436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb82=
86a8bbfda65/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-463/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Inte=
l XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a=
8bbfda65/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.ht=
ml">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#=
2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@kms_c=
dclk@mode-transition-all-outputs.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel X=
E#4418</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144506v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_co=
ntent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-433/igt@kms_con=
tent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_c=
ontent_protection@legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-d=
g2-436/igt@kms_content_protection@legacy.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4506v2/shard-dg2-436/igt@kms_content_protection@legacy.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0@pipe-a-dp-2.html">TIMEOUT</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-7/igt@kms_=
content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 o=
ther test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_c=
ontent_protection@srm.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-=
432/igt@kms_content_protection@srm.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-4=
64/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_c=
ontent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-d=
g2-466/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard=
-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_cur=
sor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfd=
a65/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">I=
ntel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144506v2/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb82=
86a8bbfda65/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interrupti=
ble.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expire=
d-vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8b=
bfda65/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a=
8bbfda65/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144506v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-=
interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_f=
lip@flip-vs-expired-vblank@b-dp4.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65=
/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0=
279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-prim=
scrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bm=
g-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28=
ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-p=
rimscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed02=
79d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-pri=
mscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v=
2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb=
28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sh=
ard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28=
ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sh=
ard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed027=
9d56bb8286a8bbfda65/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/i=
gt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28e=
d0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99=
cb28ed0279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bm=
g-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4506v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-7/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99c=
b28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1445=
06v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0=
279d56bb8286a8bbfda65/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-436/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf9=
9cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1445=
06v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506=
v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed02=
79d56bb8286a8bbfda65/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-prim=
scrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Inte=
l XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28=
ed0279d56bb8286a8bbfda65/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@kms_t=
iled_display@basic-test-pattern.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/=
shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#=
1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144506v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">In=
tel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-434/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56b=
b8286a8bbfda65/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-=
chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-436/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-433/igt@xe_ex=
ec_basic@multigpu-once-basic-defer-mmap.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8=
bbfda65/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-lnl-8/igt@xe_exec=
_queue_property@timeslice_duration_us-property-min-max.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed=
0279d56bb8286a8bbfda65/shard-lnl-6/igt@xe_exec_queue_property@timeslice_dur=
ation_us-property-min-max.html">ABORT</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-lnl-5/igt@xe_=
exec_queue_property@timeslice_duration_us-property-min-max.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel=
 XE#4624</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-1/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28=
ed0279d56bb8286a8bbfda65/shard-adlp-3/igt@xe_fault_injection@inject-fault-p=
robe-function-xe_guc_ads_init.html">DMESG-WARN</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp=
-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-432/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb828=
6a8bbfda65/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144506v2/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_l=
ive_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-463/igt@xe_pe=
er2peer@write.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-dg2-464/igt@=
xe_peer2peer@write.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-dg2-432/igt@xe_peer2p=
eer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-4/igt@xe_pm@=
s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65/shard-adlp-9/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144506v2/shard-adlp-9/i=
gt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65 -&gt; xe-pw-144=
506v2</li>
</ul>
<p>IGT_8319: db9eca9df70fbb72589fcaf689dd92784b06a9c0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2953-4e52f6bddf99cb28ed0279d56bb8286a8bbfda65: 4e52f6bddf99cb28ed0279d=
56bb8286a8bbfda65<br />
  xe-pw-144506v2: 144506v2</p>

</body>
</html>

--===============6804150214171814384==--
