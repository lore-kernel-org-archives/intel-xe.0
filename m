Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB06C369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 16:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7731C10E225;
	Fri, 18 Apr 2025 16:31:38 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C055B10E225;
 Fri, 18 Apr 2025 16:31:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4569507938541588353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fixes_for_steered_register?=
 =?utf-8?q?_capture_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Apr 2025 16:31:36 -0000
Message-ID: <174499389677.18049.5886952543751295878@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
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

--===============4569507938541588353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixes for steered register capture (rev2)
URL   : https://patchwork.freedesktop.org/series/147940/
State : failure

== Summary ==

CI Bug Log - changes from xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d_FULL -> xe-pw-147940v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147940v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147940v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147940v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-fencing:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-4/igt@kms_atomic_transition@plane-all-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-7/igt@kms_atomic_transition@plane-all-transition-fencing.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_pmu@gt-frequency.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][9] ([Intel XE#2321]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  
New tests
---------

  New tests have been introduced between xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d_FULL and xe-pw-147940v2_FULL:

### New IGT tests (2) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [19.07] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [19.05] s

  

Known issues
------------

  Here are the changes found in xe-pw-147940v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3767]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4543]) +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-2/igt@kms_async_flips@invalid-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip.html

  * {igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3} (NEW):
    - shard-bmg:          NOTRUN -> [DMESG-WARN][14] ([Intel XE#3428])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#316]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2191])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#3442])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +165 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +26 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#4416]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2341])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1188])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#308])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#309]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#1475])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#323])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#4302])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_display_modes@extended-mode-basic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#4356])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1138])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#3321]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#301] / [Intel XE#3321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#310]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2316]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#2882]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4141])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#656]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2311]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#651]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2312]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#656]) +13 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#653]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1503]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#4328])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2925])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@plane-position-hole:
    - shard-bmg:          [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#3428])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@kms_plane@plane-position-hole.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#4596])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-x.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][88] ([Intel XE#4212])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][89] ([Intel XE#4760])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#4173]) +3 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#2763]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][94] ([Intel XE#3325])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1489])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1489])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2234] / [Intel XE#2850])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#3414])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1127])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2168])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][105] -> [FAIL][106] ([Intel XE#2142]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#756])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1126])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2905]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2905]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4519])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2322])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1392]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#1392]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3428]) +14 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@xe_exec_fault_mode@invalid-va.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#288]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#288]) +9 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2905]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#255])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148]) -> ([PASS][149], [PASS][150], [SKIP][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174]) ([Intel XE#378])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-435/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-435/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-435/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-433/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-433/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-433/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_oa@enable-disable@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][175] ([Intel XE#4804])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@xe_oa@enable-disable@rcs-0.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#2284] / [Intel XE#366])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#1948])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][180] -> [ABORT][181] ([Intel XE#1794])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#4650])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#4733]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#4733])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#944])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#4814])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#4814])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#4130])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][189] ([Intel XE#4543]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][191] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][197] ([Intel XE#2291]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][199] ([Intel XE#4667]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4354]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][203] ([Intel XE#2373]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#310]) -> [PASS][206] +4 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][207] ([Intel XE#3321]) -> [PASS][208] +3 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][209] ([Intel XE#2316]) -> [PASS][210] +8 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][211] ([Intel XE#301]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][213] ([Intel XE#301]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][215] -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][217] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][218] +4 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][219] ([Intel XE#2882]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#656]) -> [PASS][222] +7 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][223] -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#4813]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][227] ([Intel XE#4596]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#309]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#3428]) -> [PASS][232] +6 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#836]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_sequence@queue-busy@pipe-c-dp-2:
    - shard-bmg:          [FAIL][235] ([Intel XE#4783]) -> [PASS][236] +2 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_sequence@queue-busy@pipe-c-dp-2.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-c-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][237] ([Intel XE#1435]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@wait-busy:
    - shard-bmg:          [FAIL][239] -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_vblank@wait-busy.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_vblank@wait-busy.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][241] ([Intel XE#1499]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1392]) -> [PASS][244] +3 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-adlp:         [DMESG-WARN][245] ([Intel XE#4173]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [FAIL][247] ([Intel XE#4541]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@xe_oa@buffer-size.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][249] ([Intel XE#1794]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][251] ([Intel XE#1794]) -> [PASS][252] +2 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#787]) -> [SKIP][254] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][256] ([Intel XE#787]) +10 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][258] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][259] ([Intel XE#1178]) -> [SKIP][260] ([Intel XE#455]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][261] ([Intel XE#3321]) -> [SKIP][262] ([Intel XE#2316])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#310]) -> [FAIL][264] ([Intel XE#301])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#2311]) -> [SKIP][266] ([Intel XE#2312]) +16 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [SKIP][268] ([Intel XE#2311]) +11 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][269] ([Intel XE#4141]) -> [SKIP][270] ([Intel XE#2312]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#4141]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#656]) -> [SKIP][274] ([Intel XE#651]) +14 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#651]) -> [SKIP][276] ([Intel XE#656]) +6 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([Intel XE#2313]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#653]) -> [SKIP][280] ([Intel XE#656]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#656]) -> [SKIP][282] ([Intel XE#653]) +14 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][283] ([Intel XE#2313]) -> [SKIP][284] ([Intel XE#2312]) +11 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][285] ([Intel XE#2493]) -> [SKIP][286] ([Intel XE#4596])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][287] ([Intel XE#4596]) -> [SKIP][288] ([Intel XE#2493])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#455]) -> [SKIP][290] ([Intel XE#4596])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783
  [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
  [Intel XE#4813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4813
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d -> xe-pw-147940v2

  IGT_8326: 8326
  xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d: 5cd835ef6352a207fa4177184b397dfd82989e5d
  xe-pw-147940v2: 147940v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/index.html

--===============4569507938541588353==
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
<tr><td><b>Series:</b></td><td>Fixes for steered register capture (rev2)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147940/">https://patchwork.freedesktop.org/series/147940/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147940v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147940v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2970-5cd835ef6352a207fa4177184b397dfd8=
2989e5d_FULL -&gt; xe-pw-147940v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147940v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147940v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1479=
40v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-4/igt@kms_atom=
ic_transition@plane-all-transition-fencing.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-7/igt@km=
s_atomic_transition@plane-all-transition-fencing.html">FAIL</a> +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_curs=
or_crc@cursor-rapid-movement-128x128.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_curs=
or_crc@cursor-rapid-movement-128x128.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_curs=
or_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms=
_cursor_legacy@short-flip-before-cursor-toggle.html">FAIL</a> +4 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAI=
L</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-onscreen-512x512:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2970-5cd835ef6352a207fa4177184=
b397dfd82989e5d_FULL and xe-pw-147940v2_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-c-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3:<=
/p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [19.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147940v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#376=
7</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-2/igt@kms_asy=
nc_flips@invalid-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-3/igt@kms_async_flips@=
invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>{igt@kms_atomic_transition@plane-all-modeset-transition@pipe-d-hdmi-a-3}=
 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_atomic_transition@plane-a=
ll-modeset-transition@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_bw@linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +165 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_chamelium_audio@hdmi-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_chamelium_color@ctm-blu=
e-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-=
after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_cursor_crc@cursor-onscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/=
shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-var=
ying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_di=
splay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_display=
_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_flip@2x-f=
lip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-3/igt@kms_flip@p=
lain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip=
@plain-flip-ts-check-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_=
flip@plain-flip-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +=
2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_joiner@basi=
c-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-=
force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@kms_plan=
e@plane-position-hole.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@kms_plane@plane-positio=
n-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_pl=
ane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_plane_multiple=
@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-8/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-2/i=
gt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325"=
>Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane=
-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_psr@fbc-pr-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_psr@psr2-cursor-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-6/igt@kms_v=
rr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@kms_writeback@writeback-chec=
k-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_eudebug@discovery-race-vm=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-=
not-in-debug-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-3/igt@xe_exec_=
fault_mode@invalid-va.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-6/igt@xe_exec_fault_mode@inva=
lid-va.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3428">Intel XE#3428</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_exec_fault_mode@many-bas=
ic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_exec_fault_mode@many-inva=
lid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpo=
int-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82=
989e5d/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b39=
7dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa417=
7184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a20=
7fa4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6=
352a207fa4177184b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd=
835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-29=
70-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397dfd8298=
9e5d/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa4177184b397d=
fd82989e5d/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa417718=
4b397dfd82989e5d/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352a207fa=
4177184b397dfd82989e5d/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835ef6352=
a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-5cd835=
ef6352a207fa4177184b397dfd82989e5d/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2970-=
5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_lo=
ad@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147940v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47940v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147940v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147940v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/=
shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147940v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2=
-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147940v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147940v2/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@xe_oa@enable-disable@rcs-0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4804">Intel XE#4804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-4/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147940v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_query@multigpu-query-inva=
lid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-adlp-6/igt@xe_render_copy@render-stress=
-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/igt@xe_render_copy@render-stres=
s-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147940v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147940v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-434/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-463/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2=
-436/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147940v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_f=
lip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147940v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@d-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2=
/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
40v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-d=
raw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@kms_pl=
ane_lowres@tiling-4.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_plane_lowres@=
tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-434/igt@kms_pl=
ane_lowres@tiling-4@pipe-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4813">Intel XE#4813</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2=
-436/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_pl=
ane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-466/=
igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_plan=
e_scaling@planes-upscale-20x20.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-=
2/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> +6 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_pm=
_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-436/igt@kms_pm_rpm@d=
pms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_sequ=
ence@queue-busy@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4783">Intel XE#4783</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms=
_sequence@queue-busy@pipe-c-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_vbla=
nk@wait-busy.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147940v2/shard-bmg-1/igt@kms_vblank@wait-busy.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-3/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard=
-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE=
#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147940v2/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-x=
e_wa_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@xe_oa@bu=
ffer-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4541">Intel XE#4541</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@xe_oa@buffer-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-lnl-2/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-lnl-8/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-adlp-9/igt@xe_pm@s=
4-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147940v2/shard-adlp-8/igt@xe_pm@s4-mocs.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940=
v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147940v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-m=
c-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-=
dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel=
 XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
40v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
40v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
940v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47940v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1479=
40v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7940v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-bmg-2/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d/shard-dg2-466/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147940v2/shard-dg2-464/igt@kms_p=
lane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d -&gt; xe-pw-147=
940v2</li>
</ul>
<p>IGT_8326: 8326<br />
  xe-2970-5cd835ef6352a207fa4177184b397dfd82989e5d: 5cd835ef6352a207fa41771=
84b397dfd82989e5d<br />
  xe-pw-147940v2: 147940v2</p>

</body>
</html>

--===============4569507938541588353==--
