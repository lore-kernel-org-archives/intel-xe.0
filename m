Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5CCD3ABF5
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 20:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3510E0F4;
	Mon, 11 Nov 2024 20:17:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AD010E0F4;
 Mon, 11 Nov 2024 20:17:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4725495356163297890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915=3A_intel=5Fdisplay_con?=
 =?utf-8?q?versions=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 20:17:33 -0000
Message-ID: <173135625399.2726703.11322015752884855867@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731347547.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731347547.git.jani.nikula@intel.com>
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

--===============4725495356163297890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: intel_display conversions, cleanups
URL   : https://patchwork.freedesktop.org/series/141175/
State : failure

== Summary ==

CI Bug Log - changes from xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9_full -> xe-pw-141175v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141175v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141175v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141175v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][3] +10 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +3 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-adlp:         [PASS][8] -> [WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@xe_sriov_flr@flr-each-isolation.html

  
New tests
---------

  New tests have been introduced between xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9_full and xe-pw-141175v1_full:

### New IGT tests (36) ###

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-141175v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2423])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@core_getstats.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_getstats.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     NOTRUN -> [FAIL][14] ([Intel XE#3130] / [Intel XE#3249])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#3339])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2134]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@fbdev@info.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#873])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#873])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#2423] / [i915#2575]) +92 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2370])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [FAIL][25] ([Intel XE#1426])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#619])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1874]) +5 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2351] / [Intel XE#2890]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1231] / [Intel XE#1242]) +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +168 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#2890]) +34 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#787]) +35 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#616]) +9 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#1195] / [Intel XE#1727])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#314]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2724])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1152]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_color@degamma.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#2715])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1188])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#308])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#309])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1508])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#301]) +2 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#301]) +3 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#2882])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301]) +3 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp5.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2351] / [Intel XE#2890]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#3194]) +5 other tests dmesg-fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [PASS][76] -> [INCOMPLETE][77] ([Intel XE#1195] / [Intel XE#2049])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1195]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#651])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#1861])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#2333])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2890]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#656])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#653]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#455])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#346])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2763]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1129])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2446]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_pm_rpm@cursor-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1489])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#3414])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#3414]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2168])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2168])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#756])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1280] / [Intel XE#455])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1126])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         [PASS][111] -> [FAIL][112] ([Intel XE#2667])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2905]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2905]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2905]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][116] -> [FAIL][117] ([Intel XE#1600])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][118] -> [TIMEOUT][119] ([Intel XE#1473])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#261] / [Intel XE#688])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#1130]) +166 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1130]) +16 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-adlp:         [PASS][124] -> [TIMEOUT][125] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests timeout
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2322]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#288]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#288]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#1630]) +2 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][131] ([Intel XE#2961] / [Intel XE#3191]) +1 other test timeout
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2229])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#2541])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2541]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          [PASS][135] -> [FAIL][136] ([Intel XE#2514]) +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][137] ([Intel XE#1173]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][138] -> [ABORT][139] ([Intel XE#1358] / [Intel XE#1607])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][140] -> [ABORT][141] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][142] -> [ABORT][143] ([Intel XE#1794])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#944]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#944])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1885]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2134]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@fbdev@unaligned-write.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@fbdev@unaligned-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][150] ([Intel XE#1195]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#877]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][154] ([Intel XE#1242]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][156] ([Intel XE#1231] / [Intel XE#1242]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][158] ([Intel XE#1874]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][160] ([Intel XE#3194]) -> [PASS][161] +2 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [FAIL][162] ([Intel XE#1475]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2423]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_dp_aux_dev.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][166] ([Intel XE#301]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][168] ([Intel XE#2882]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-adlp:         [DMESG-FAIL][170] ([Intel XE#3086]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][172] -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][174] ([Intel XE#886]) -> [PASS][175] +3 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2890]) -> [PASS][177] +27 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][179] +8 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][180] ([Intel XE#1861]) -> [PASS][181] +3 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][182] ([Intel XE#1503]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - shard-adlp:         [DMESG-WARN][184] ([Intel XE#3086]) -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2423] / [i915#2575]) -> [PASS][187] +90 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#2446]) -> [PASS][189] +7 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][190] ([Intel XE#1473]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1130]) -> [PASS][193] +161 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [FAIL][194] ([Intel XE#1630]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [FAIL][196] ([Intel XE#2249]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][198] ([Intel XE#1794]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2423] / [i915#2575]) -> [SKIP][201] ([Intel XE#623])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2-set2:     [INCOMPLETE][202] ([Intel XE#1195]) -> [FAIL][203] ([Intel XE#1426])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2890]) -> [SKIP][205] ([Intel XE#316]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [SKIP][206] ([Intel XE#1124]) -> [TIMEOUT][207] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#316]) -> [SKIP][209] ([Intel XE#2890]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][210] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][211] ([Intel XE#3194])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1124]) -> [SKIP][213] ([Intel XE#2890]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2890]) -> [SKIP][215] ([Intel XE#610])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1124]) -> [SKIP][217] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#2890]) -> [SKIP][219] ([Intel XE#1124]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][220] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052]) -> [DMESG-FAIL][221] ([Intel XE#3194])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][223] ([Intel XE#1124]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#619]) -> [SKIP][225] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#607]) -> [SKIP][227] ([Intel XE#2890])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#610]) -> [SKIP][229] ([Intel XE#2890])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2423] / [i915#2575]) -> [SKIP][231] ([Intel XE#367]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2191]) -> [SKIP][233] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2423] / [i915#2575]) -> [SKIP][235] ([Intel XE#2191]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#367]) -> [SKIP][237] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][239] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2890]) -> [SKIP][241] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2890]) -> [SKIP][243] ([Intel XE#2907]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2890]) -> [FAIL][245] ([Intel XE#616])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][247] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][249] ([Intel XE#2351] / [Intel XE#2890])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][251] ([Intel XE#2890]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2423] / [i915#2575]) -> [SKIP][253] ([Intel XE#306])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#306]) -> [SKIP][255] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2423] / [i915#2575]) -> [SKIP][257] ([Intel XE#373]) +13 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#373]) -> [SKIP][259] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2423] / [i915#2575]) -> [SKIP][261] ([Intel XE#307]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][262] ([Intel XE#1178]) -> [INCOMPLETE][263] ([Intel XE#2715]) +1 other test incomplete
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-3/igt@kms_content_protection@legacy.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455]) -> [SKIP][265] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_content_protection@lic-type-1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][266] ([Intel XE#1178]) -> [SKIP][267] ([Intel XE#2423] / [i915#2575])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_content_protection@srm.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2423] / [i915#2575]) -> [FAIL][269] ([Intel XE#1188])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_content_protection@uevent.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#308]) -> [SKIP][271] ([Intel XE#2423] / [i915#2575])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2423] / [i915#2575]) -> [SKIP][273] ([Intel XE#308])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#323]) -> [SKIP][275] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#776]) -> [SKIP][277] ([Intel XE#2890])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [FAIL][279] ([Intel XE#301])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#455]) -> [SKIP][281] ([Intel XE#2890])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][283] ([Intel XE#455])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#455]) -> [SKIP][285] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2890]) -> [SKIP][287] ([Intel XE#455]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#651]) -> [SKIP][289] ([Intel XE#2890]) +26 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2890]) -> [SKIP][291] ([Intel XE#651]) +22 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][292] ([Intel XE#1861]) -> [TIMEOUT][293] ([Intel XE#1033] / [Intel XE#1727])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][294] ([Intel XE#1861]) -> [DMESG-WARN][295] ([Intel XE#3086])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][297] ([Intel XE#651]) +10 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#651]) -> [SKIP][299] ([Intel XE#2351] / [Intel XE#2890]) +9 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#658]) -> [SKIP][301] ([Intel XE#2351] / [Intel XE#2890])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][303] ([Intel XE#653]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][305] ([Intel XE#658])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2890]) -> [SKIP][307] ([Intel XE#1158])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#653]) -> [SKIP][309] ([Intel XE#2351] / [Intel XE#2890]) +11 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#653]) -> [SKIP][311] ([Intel XE#2890]) +22 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2890]) -> [SKIP][313] ([Intel XE#653]) +29 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#2423] / [i915#2575]) -> [SKIP][315] ([Intel XE#605])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [FAIL][316] ([Intel XE#3312] / [Intel XE#3404]) -> [SKIP][317] ([Intel XE#2423] / [i915#2575])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2925]) -> [SKIP][319] ([Intel XE#2890])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2890]) -> [SKIP][321] ([Intel XE#2925])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2927]) -> [SKIP][323] ([Intel XE#2890])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][324] ([Intel XE#1035]) -> [INCOMPLETE][325] ([Intel XE#1035] / [Intel XE#1195])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_plane@pixel-format.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][326] ([Intel XE#616]) -> [SKIP][327] ([Intel XE#2423] / [i915#2575])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_plane_cursor@primary.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2423] / [i915#2575]) -> [SKIP][329] ([Intel XE#2763] / [Intel XE#455])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][331] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#870]) -> [SKIP][333] ([Intel XE#2890]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1122]) -> [SKIP][335] ([Intel XE#2351] / [Intel XE#2890])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][336] -> [SKIP][337] ([Intel XE#3309])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#908]) -> [SKIP][339] ([Intel XE#2890])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2890]) -> [SKIP][341] ([Intel XE#1489]) +8 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1489]) -> [SKIP][343] ([Intel XE#2890]) +6 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][345] ([Intel XE#2351] / [Intel XE#2890])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-blt.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][347] ([Intel XE#2890]) +11 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][349] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2890]) -> [SKIP][351] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2351]) -> [SKIP][353] ([Intel XE#2850] / [Intel XE#929])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][355] ([Intel XE#2351])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         [SKIP][356] ([Intel XE#1127]) -> [TIMEOUT][357] ([Intel XE#1033] / [Intel XE#1727])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#3414]) -> [SKIP][359] ([Intel XE#2423] / [i915#2575])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2423] / [i915#2575]) -> [SKIP][361] ([Intel XE#1127]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2423] / [i915#2575]) -> [SKIP][363] ([Intel XE#3414]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][364] ([Intel XE#1729]) -> [SKIP][365] ([Intel XE#2426])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][366] ([Intel XE#1729]) -> [SKIP][367] ([Intel XE#362])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][368] ([Intel XE#2509]) -> [SKIP][369] ([Intel XE#2426])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#362]) -> [SKIP][371] ([Intel XE#1500])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2423] / [i915#2575]) -> [SKIP][373] ([Intel XE#455]) +8 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2168]) -> [SKIP][375] ([Intel XE#2423] / [i915#2575])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_vrr@lobf.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#756]) -> [SKIP][377] ([Intel XE#2423] / [i915#2575])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][379] ([Intel XE#1130]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1130]) -> [SKIP][381] ([Intel XE#1280] / [Intel XE#455])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1123]) -> [SKIP][383] ([Intel XE#1130])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1130]) -> [SKIP][385] ([Intel XE#1126])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1130]) -> [FAIL][387] ([Intel XE#2667])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#1130]) -> [SKIP][389] ([Intel XE#2905]) +10 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#2905]) -> [SKIP][391] ([Intel XE#1130]) +12 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#1130]) -> [SKIP][393] ([Intel XE#288]) +25 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#288]) -> [SKIP][395] ([Intel XE#1130]) +24 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#1130]) -> [SKIP][397] ([Intel XE#2360])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2360]) -> [SKIP][399] ([Intel XE#1130])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#255]) -> [SKIP][401] ([Intel XE#1130])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#560]) -> [SKIP][403] ([Intel XE#1130])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#512]) -> [SKIP][405] ([Intel XE#1130])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_mmap@small-bar.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1130]) -> [SKIP][407] ([Intel XE#2541]) +7 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2541]) -> [SKIP][409] ([Intel XE#1130]) +5 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1130]) -> [SKIP][411] ([Intel XE#1337])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1130]) -> [SKIP][413] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2284]) -> [SKIP][415] ([Intel XE#1130])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][417] ([Intel XE#1130]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1130]) -> [SKIP][419] ([Intel XE#944]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#944]) -> [SKIP][421] ([Intel XE#1130]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#3342]) -> [SKIP][423] ([Intel XE#1130])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#1130]) -> [SKIP][425] ([Intel XE#3342])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8102 -> IGT_8103
  * Linux: xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 -> xe-pw-141175v1

  IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9
  xe-pw-141175v1: 141175v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/index.html

--===============4725495356163297890==
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
<tr><td><b>Series:</b></td><td>drm/i915: intel_display conversions, cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141175/">https://patchwork.freedesktop.org/series/141175/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9_full -&gt; xe-pw-141175v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141175v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141175v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141175v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@xe_sriov_flr@flr-each-isolation.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9_full and xe-pw-141175v1_full:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141175v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@core_getstats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +168 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-to-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-6/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@core_hotunplug@unplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_dp_aux_dev.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> +90 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +161 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-5/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-1/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-432/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141175v1/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8102 -&gt; IGT_8103</li>
<li>Linux: xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9 -&gt; xe-pw-141175v1</li>
</ul>
<p>IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8103: 43994179978d4a120226f253cb95209d59639ef9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2206-6d0fd3fb958e77717cedf35f49325c7c0dfa11c9: 6d0fd3fb958e77717cedf35f49325c7c0dfa11c9<br />
  xe-pw-141175v1: 141175v1</p>

</body>
</html>

--===============4725495356163297890==--
