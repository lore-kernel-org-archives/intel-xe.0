Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CFBE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 10:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6B10E055;
	Tue, 14 Jan 2025 10:51:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BD910E055;
 Tue, 14 Jan 2025 10:51:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2651848702665718418=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe/display=3A_Unify_DPT_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 10:51:26 -0000
Message-ID: <173685188668.3569143.2041309378614227589@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250112221344.644836-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250112221344.644836-1-juhapekka.heikkila@gmail.com>
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

--===============2651848702665718418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/display: Unify DPT mapping
URL   : https://patchwork.freedesktop.org/series/143436/
State : failure

== Summary ==

CI Bug Log - changes from xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780_full -> xe-pw-143436v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143436v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143436v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143436v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          ([PASS][1], [PASS][2]) -> [INCOMPLETE][3] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-5/igt@kms_plane_cursor@primary.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-6/igt@kms_plane_cursor@primary.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-2/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          ([PASS][4], [PASS][5]) -> [FAIL][6]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-bmg:          ([PASS][7], [PASS][8]) -> [DMESG-WARN][9]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@xe_exec_reset@close-execqueues-close-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_exec_reset@close-execqueues-close-fd.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@xe_exec_reset@close-execqueues-close-fd.html

  
#### Warnings ####

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          ([TIMEOUT][10], [TIMEOUT][11]) ([Intel XE#1473]) -> [DMESG-FAIL][12]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          [SKIP][13] ([Intel XE#2322]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_exec_basic@multigpu-once-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-143436v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         ([PASS][15], [PASS][16]) -> [DMESG-WARN][17] ([Intel XE#1033])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          ([PASS][18], [PASS][19]) -> [FAIL][20] ([Intel XE#3908]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#1033]) +12 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#316]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     ([PASS][25], [PASS][26]) -> [DMESG-FAIL][27] ([Intel XE#1033]) +7 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][28] ([Intel XE#1033])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#610])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +62 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#787]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1727] / [Intel XE#3124]) +1 other test incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          ([PASS][44], [PASS][45]) -> [SKIP][46] ([Intel XE#2291]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          ([PASS][47], [PASS][48]) -> [INCOMPLETE][49] ([Intel XE#3226])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#310])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#3321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#3321]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#301])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          ([PASS][59], [PASS][60]) -> [FAIL][61] ([Intel XE#2882]) +2 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          ([PASS][62], [PASS][63]) -> [SKIP][64] ([Intel XE#2316]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     ([PASS][65], [PASS][66]) -> [FAIL][67] ([Intel XE#301]) +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#656]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#651])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#651]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#653])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#653]) +11 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#2763]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2763]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#3309])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#3309])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#1430])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1129])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1489]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#3414])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_sysfs_edid_timing:
    - shard-bmg:          ([PASS][86], [PASS][87]) -> [FAIL][88] ([Intel XE#1174])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_sysfs_edid_timing.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_sysfs_edid_timing.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#756])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#756])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2905]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2905])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#261] / [Intel XE#688])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#1392])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1392])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#288]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#288]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         ([PASS][100], [PASS][101]) -> [DMESG-WARN][102] ([Intel XE#2953]) +1 other test dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#4045])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-parallel.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4045])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_oa@oa-formats.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1337])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1337])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2284] / [Intel XE#366])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [PASS][109] -> [ABORT][110] ([Intel XE#1358])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@xe_pm@s4-exec-after.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_pm@s4-exec-after.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         ([DMESG-WARN][111], [DMESG-WARN][112]) ([Intel XE#1033]) -> [PASS][113]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         ([DMESG-WARN][114], [PASS][115]) ([Intel XE#1033]) -> [PASS][116]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          ([PASS][117], [SKIP][118]) ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][119] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#3862]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][124] ([Intel XE#3124]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     ([PASS][128], [INCOMPLETE][129]) ([Intel XE#3226]) -> [PASS][130]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          ([SKIP][131], [PASS][132]) ([Intel XE#2291]) -> [PASS][133] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          ([PASS][134], [FAIL][135]) ([Intel XE#1475]) -> [PASS][136]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          ([PASS][137], [SKIP][138]) ([Intel XE#1340]) -> [PASS][139]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#301]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          ([SKIP][142], [PASS][143]) ([Intel XE#2316]) -> [PASS][144] +5 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          ([FAIL][145], [PASS][146]) ([Intel XE#2882] / [Intel XE#3288]) -> [PASS][147]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          ([FAIL][148], [PASS][149]) ([Intel XE#3288] / [Intel XE#3321]) -> [PASS][150]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:
    - shard-dg2-set2:     ([FAIL][151], [FAIL][152]) ([Intel XE#301]) -> [PASS][153]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          ([PASS][154], [FAIL][155]) ([Intel XE#3321]) -> [PASS][156] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         ([DMESG-WARN][157], [DMESG-WARN][158]) ([Intel XE#2953]) -> [PASS][159] +4 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          ([PASS][160], [INCOMPLETE][161]) ([Intel XE#2597]) -> [PASS][162]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         ([DMESG-WARN][163], [PASS][164]) ([Intel XE#2953]) -> [PASS][165] +8 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          ([INCOMPLETE][166], [PASS][167]) ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][168]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          ([PASS][169], [FAIL][170]) ([Intel XE#886]) -> [PASS][171] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          ([SKIP][172], [PASS][173]) ([Intel XE#3012]) -> [PASS][174]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          ([SKIP][175], [PASS][176]) ([Intel XE#1435]) -> [PASS][177] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1392]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          ([PASS][180], [SKIP][181]) ([Intel XE#1192]) -> [PASS][182] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         ([ABORT][183], [PASS][184]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][185]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-basic.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@xe_pm@s4-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         ([ABORT][186], [PASS][187]) ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][188]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][189] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
    - shard-dg2-set2:     [ABORT][191] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          ([FAIL][193], [INCOMPLETE][194]) ([Intel XE#1178] / [Intel XE#2715]) -> [INCOMPLETE][195] ([Intel XE#2715]) +1 other test incomplete
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          ([FAIL][196], [SKIP][197]) ([Intel XE#1178] / [Intel XE#2341]) -> [SKIP][198] ([Intel XE#2341])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          ([SKIP][199], [INCOMPLETE][200]) ([Intel XE#2341] / [Intel XE#2715]) -> [FAIL][201] ([Intel XE#1188])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_content_protection@uevent.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_content_protection@uevent.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][202] ([Intel XE#2715]) -> [FAIL][203] ([Intel XE#1188])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          ([SKIP][204], [PASS][205]) ([Intel XE#2291]) -> [SKIP][206] ([Intel XE#2291])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          ([SKIP][207], [DMESG-WARN][208]) ([Intel XE#2291] / [Intel XE#877]) -> [SKIP][209] ([Intel XE#2291])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          ([DMESG-WARN][210], [SKIP][211]) ([Intel XE#2291] / [Intel XE#877]) -> [DMESG-WARN][212] ([Intel XE#877])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          ([FAIL][213], [SKIP][214]) ([Intel XE#2316] / [Intel XE#2882]) -> [FAIL][215] ([Intel XE#2882])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          ([FAIL][216], [SKIP][217]) ([Intel XE#2316] / [Intel XE#2882] / [Intel XE#3288]) -> [FAIL][218] ([Intel XE#2882] / [Intel XE#3288])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     ([FAIL][219], [PASS][220]) ([Intel XE#301]) -> [FAIL][221] ([Intel XE#301]) +1 other test fail
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][222], [SKIP][223]) ([Intel XE#2311]) -> [SKIP][224] ([Intel XE#2312]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#2312]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          ([SKIP][227], [SKIP][228]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][229] ([Intel XE#2311]) +21 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          ([FAIL][230], [SKIP][231]) ([Intel XE#2312] / [Intel XE#2333]) -> [FAIL][232] ([Intel XE#2333]) +7 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          ([FAIL][233], [SKIP][234]) ([Intel XE#2312] / [Intel XE#2333]) -> [SKIP][235] ([Intel XE#2312])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          ([FAIL][236], [FAIL][237]) ([Intel XE#2333]) -> [SKIP][238] ([Intel XE#2312]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          ([SKIP][239], [SKIP][240]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][241] ([Intel XE#2312]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#2313]) -> [SKIP][243] ([Intel XE#2312]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          ([SKIP][244], [SKIP][245]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][246] ([Intel XE#2312]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          ([SKIP][247], [SKIP][248]) ([Intel XE#2313]) -> [SKIP][249] ([Intel XE#2312]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][250], [SKIP][251]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][252] ([Intel XE#2313]) +19 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][253] ([Intel XE#1033]) -> [FAIL][254] ([Intel XE#1874])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-3/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-adlp:         ([PASS][255], [DMESG-WARN][256]) ([Intel XE#2953]) -> [DMESG-WARN][257] ([Intel XE#2953])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@kms_pm_rpm@system-suspend-modeset.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          ([SKIP][258], [SKIP][259]) ([Intel XE#2426] / [Intel XE#2509]) -> [SKIP][260] ([Intel XE#2426])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          ([PASS][261], [SKIP][262]) ([Intel XE#1499]) -> [SKIP][263] ([Intel XE#1499])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     ([TIMEOUT][264], [FAIL][265]) ([Intel XE#1000] / [Intel XE#1473]) -> [TIMEOUT][266] ([Intel XE#1473])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     ([PASS][267], [TIMEOUT][268]) ([Intel XE#1473] / [Intel XE#402]) -> [TIMEOUT][269] ([Intel XE#1473] / [Intel XE#402])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          ([TIMEOUT][270], [INCOMPLETE][271]) ([Intel XE#1473]) -> [TIMEOUT][272] ([Intel XE#1473]) +1 other test timeout
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          ([TIMEOUT][273], [FAIL][274]) ([Intel XE#1000] / [Intel XE#1473] / [Intel XE#2472]) -> [FAIL][275] ([Intel XE#1000])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@xe_evict@evict-threads-large.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_evict@evict-threads-large.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     ([SKIP][276], [PASS][277]) ([Intel XE#1392]) -> [SKIP][278] ([Intel XE#1392])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          ([SKIP][279], [PASS][280]) ([Intel XE#1192]) -> [SKIP][281] ([Intel XE#1192])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          ([SKIP][282], [SKIP][283]) ([Intel XE#1192] / [Intel XE#2833]) -> [SKIP][284] ([Intel XE#1192])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     ([PASS][285], [ABORT][286]) ([Intel XE#1358] / [Intel XE#1794]) -> [ABORT][287] ([Intel XE#1358] / [Intel XE#1794])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780 -> xe-pw-143436v1

  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780: 83e5b68f2dee4e409b69f279da7562073e2c5780
  xe-pw-143436v1: 143436v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/index.html

--===============2651848702665718418==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/display: Unify DPT mapping</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143436/">https://patchwork.freedesktop.org/series/143436/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780_full -&gt; xe-pw-143436v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143436v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-143436v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-143436v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-5/igt@kms_plane_cursor@primary.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-6/igt@kms_plane_cursor@primary.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-2/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143436v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +12 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_sysfs_edid_timing.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_sysfs_edid_timing.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_flip@2x-plain-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +4 other tests pass</li>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_content_protection@uevent.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-3/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-adlp-9/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-3/igt@xe_evict@evict-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-6/igt@xe_evict@evict-threads-large.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-1/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143436v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780 -&gt; xe-pw-143436v1</li>
</ul>
<p>IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2475-83e5b68f2dee4e409b69f279da7562073e2c5780: 83e5b68f2dee4e409b69f279da7562073e2c5780<br />
  xe-pw-143436v1: 143436v1</p>

</body>
</html>

--===============2651848702665718418==--
