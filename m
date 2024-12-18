Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7FCE7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 09:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8982E10E23C;
	Wed, 18 Dec 2024 09:24:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90610E23C;
 Wed, 18 Dec 2024 09:24:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5446727636625786755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Check_if_is_vblank_too_sho?=
 =?utf-8?q?rt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 09:24:36 -0000
Message-ID: <173451387681.4187571.7480962215961089244@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241217180710.1048355-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============5446727636625786755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check if is vblank too short
URL   : https://patchwork.freedesktop.org/series/142746/
State : failure

== Summary ==

CI Bug Log - changes from xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076_full -> xe-pw-142746v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142746v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142746v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142746v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@test-time-stamp:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic@test-only:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +15 other tests incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@kms_atomic@test-only.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_atomic@test-only.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [PASS][4] -> [SKIP][5] +22 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] +30 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][8] -> [SKIP][9] +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][11] +43 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][12] -> [DMESG-FAIL][13] +95 other tests dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:
    - shard-bmg:          [PASS][14] -> [DMESG-FAIL][15] +52 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][16] -> [DMESG-WARN][17] +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][18] -> [FAIL][19] +654 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] +669 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] +299 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] +27 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_multiple@tiling-4@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][26] +13 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_plane_multiple@tiling-4@pipe-b-dp-2.html

  * igt@kms_plane_multiple@tiling-x@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] +27 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_plane_multiple@tiling-x@pipe-a-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_plane_multiple@tiling-x@pipe-a-dp-4.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          [PASS][29] -> [DMESG-FAIL][30] +3 other tests dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr-cursor-render@edp-1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] +555 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_psr@fbc-psr-cursor-render@edp-1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_psr@fbc-psr-cursor-render@edp-1.html

  * igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1:
    - shard-lnl:          [PASS][33] -> [INCOMPLETE][34] +38 other tests incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          NOTRUN -> [FAIL][35] +190 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_pat@display-vs-wb-transient.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-lnl:          [FAIL][36] ([Intel XE#911]) -> [INCOMPLETE][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][38] ([Intel XE#3719]) -> [INCOMPLETE][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     [INCOMPLETE][40] ([Intel XE#3781]) -> [INCOMPLETE][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_async_flips@crc-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_async_flips@crc-atomic.html
    - shard-bmg:          [INCOMPLETE][42] ([Intel XE#3781]) -> [INCOMPLETE][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_async_flips@crc-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_async_flips@crc-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          [SKIP][44] ([Intel XE#3279]) -> [INCOMPLETE][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][46] ([Intel XE#2327]) -> [FAIL][47] +12 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][48] ([Intel XE#1407]) -> [FAIL][49] +10 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [DMESG-WARN][50] ([Intel XE#1725]) -> [FAIL][51] +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][52] ([Intel XE#316]) -> [FAIL][53] +7 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][54] ([Intel XE#2314] / [Intel XE#2894]) -> [DMESG-WARN][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][56] ([Intel XE#2341]) -> [INCOMPLETE][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_content_protection@mei-interface.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][58] ([Intel XE#3278]) -> [INCOMPLETE][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_content_protection@uevent.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:
    - shard-bmg:          [TIMEOUT][60] -> [DMESG-FAIL][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][62] ([Intel XE#2291]) -> [DMESG-FAIL][63] +2 other tests dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][64] ([Intel XE#2882]) -> [FAIL][65] +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][66] ([Intel XE#3321]) -> [FAIL][67] +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][68] ([Intel XE#2597]) -> [FAIL][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][70] -> [FAIL][71] +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-bmg:          [SKIP][72] ([Intel XE#2316]) -> [FAIL][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][74] ([Intel XE#2333]) -> [FAIL][75] +48 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][76] ([Intel XE#2312]) -> [FAIL][77] +7 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [FAIL][78] ([Intel XE#616]) -> [DMESG-FAIL][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_plane_cursor@overlay.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][80] ([Intel XE#616]) -> [FAIL][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][82] ([Intel XE#736]) -> [FAIL][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][84] ([Intel XE#1430]) -> [FAIL][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][86] ([Intel XE#2893]) -> [FAIL][87] +15 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][88] ([Intel XE#1127]) -> [FAIL][89] +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          [SKIP][90] ([Intel XE#2330]) -> [FAIL][91] +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1127]) -> [FAIL][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][94] ([Intel XE#899]) -> [FAIL][95] +3 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [TIMEOUT][96] ([Intel XE#3859]) -> [FAIL][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_gt_freq@freq_suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-142746v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][98] -> [DMESG-WARN][99] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-lnl:          [PASS][100] -> [FAIL][101] ([Intel XE#1426])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-fencing.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [PASS][102] -> [INCOMPLETE][103] ([Intel XE#2613]) +8 other tests incomplete
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][104] ([Intel XE#2613]) +1 other test incomplete
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#607])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#610]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1124])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2314] / [Intel XE#2894])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#367])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2887]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#3432])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2325])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2252]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2390])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][116] ([Intel XE#2715])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2320]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][118] ([Intel XE#2055])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [PASS][119] -> [INCOMPLETE][120] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests incomplete
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2286])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][122] ([Intel XE#3226])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-dg2-set2:     [PASS][123] -> [INCOMPLETE][124] ([Intel XE#3226])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][125] -> [SKIP][126] ([Intel XE#2291]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#2425])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2374])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][130] -> [FAIL][131] ([Intel XE#3333])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#310])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][134] -> [FAIL][135] ([Intel XE#3149]) +5 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#3149])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-dp4:
    - shard-dg2-set2:     [PASS][138] -> [DMESG-FAIL][139] ([Intel XE#3468]) +6 other tests dmesg-fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_flip@plain-flip-ts-check@a-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip@plain-flip-ts-check@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][140] -> [DMESG-FAIL][141] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_flip@plain-flip-ts-check@b-hdmi-a6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip@plain-flip-ts-check@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-lnl:          [PASS][142] -> [SKIP][143] ([Intel XE#1745]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2293] / [Intel XE#2380])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2293])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-linear:
    - shard-dg2-set2:     [PASS][146] -> [SKIP][147] ([Intel XE#455]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-linear.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2311]) +18 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2313]) +17 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#346])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-dg2-set2:     [PASS][151] -> [INCOMPLETE][152] ([Intel XE#1035])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_plane@pixel-format.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_plane@pixel-format.html
    - shard-bmg:          [PASS][153] -> [INCOMPLETE][154] ([Intel XE#1035])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_plane@pixel-format.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [PASS][155] -> [INCOMPLETE][156] ([Intel XE#1035] / [Intel XE#2566])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_plane@pixel-format-source-clamping.html
    - shard-lnl:          [PASS][157] -> [INCOMPLETE][158] ([Intel XE#2566])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][159] ([Intel XE#1035] / [Intel XE#2566])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [PASS][160] -> [SKIP][161] ([Intel XE#3380]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][162] -> [SKIP][163] ([Intel XE#3380])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][164] -> [SKIP][165] ([Intel XE#2763]) +59 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-dg2-set2:     [PASS][166] -> [INCOMPLETE][167] ([Intel XE#2566]) +4 other tests incomplete
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2763]) +14 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#2763] / [Intel XE#455]) +19 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-bmg:          [PASS][171] -> [DMESG-WARN][172] ([Intel XE#2566]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-bmg:          [PASS][173] -> [INCOMPLETE][174] ([Intel XE#2566]) +1 other test incomplete
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][175] -> [SKIP][176] ([Intel XE#2763]) +25 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2-set2:     [PASS][177] -> [INCOMPLETE][178] ([Intel XE#2566] / [Intel XE#3468])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - shard-dg2-set2:     [PASS][179] -> [INCOMPLETE][180] ([Intel XE#3468])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-dg2-set2:     [PASS][181] -> [SKIP][182] ([Intel XE#2763]) +29 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#1489]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2387])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2450])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#1499])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2905]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][189] -> [TIMEOUT][190] ([Intel XE#1473])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2322]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-dg2-set2:     [PASS][192] -> [DMESG-WARN][193] ([Intel XE#3343])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#2457])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][195] -> [DMESG-WARN][196] ([Intel XE#3468]) +2 other tests dmesg-warn
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_load@reload.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][197] -> [DMESG-WARN][198] ([Intel XE#3467])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2284])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][200] -> [DMESG-WARN][201] ([Intel XE#3468] / [Intel XE#569])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][202] -> [INCOMPLETE][203] ([Intel XE#569])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][204] -> [ABORT][205] ([Intel XE#1794])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_pm@s4-mocs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#944])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][207] ([Intel XE#3070]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][209] ([Intel XE#1503]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][211] ([Intel XE#718]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][213] ([Intel XE#1435]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-dg2-set2:     [FAIL][215] -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][217] ([Intel XE#1600]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][219] -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][221], [PASS][222], [PASS][223], [PASS][224], [SKIP][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246]) ([Intel XE#378]) -> ([PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [SKIP][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297]) ([Intel XE#2457]) -> ([PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-7/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-7/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([SKIP][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347]) ([Intel XE#378]) -> ([PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [INCOMPLETE][373] -> [PASS][374] +1 other test pass
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_pm@s3-mocs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_pm@s3-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][375] ([Intel XE#958]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [FAIL][377] -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_wedged@basic-wedged.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#787]) -> [SKIP][380] ([Intel XE#455] / [Intel XE#787])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][381] ([Intel XE#2341]) -> [INCOMPLETE][382] ([Intel XE#2715])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][383] ([Intel XE#1178]) -> [INCOMPLETE][384] ([Intel XE#2715]) +1 other test incomplete
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][385] ([Intel XE#1178]) -> [INCOMPLETE][386] ([Intel XE#2715]) +1 other test incomplete
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#455]) -> [INCOMPLETE][388] ([Intel XE#2715])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_content_protection@lic-type-1.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms_content_protection@lic-type-1.html
    - shard-lnl:          [SKIP][389] ([Intel XE#3278]) -> [INCOMPLETE][390] ([Intel XE#2715]) +2 other tests incomplete
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_content_protection@lic-type-1.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][391] ([Intel XE#1188]) -> [INCOMPLETE][392] ([Intel XE#2715])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_content_protection@uevent.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][393] ([Intel XE#1188]) -> [INCOMPLETE][394] ([Intel XE#2715])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_content_protection@uevent.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-bmg:          [TIMEOUT][395] -> [DMESG-FAIL][396] ([Intel XE#2055])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][397] ([Intel XE#877]) -> [SKIP][398] ([Intel XE#2291])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][399] ([Intel XE#2316]) -> [FAIL][400] ([Intel XE#3333])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][401] ([Intel XE#2312]) -> [SKIP][402] ([Intel XE#2311]) +11 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][403] ([Intel XE#2311]) -> [SKIP][404] ([Intel XE#2312]) +4 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][405] ([Intel XE#2333]) -> [SKIP][406] ([Intel XE#2312]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#651]) -> [SKIP][408] ([Intel XE#656])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][409] ([Intel XE#2313]) -> [SKIP][410] ([Intel XE#2312]) +7 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][411] ([Intel XE#2312]) -> [SKIP][412] ([Intel XE#2313]) +9 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][413] ([Intel XE#1473]) -> [FAIL][414] ([Intel XE#1000])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][415] ([Intel XE#1473]) -> [INCOMPLETE][416] ([Intel XE#1473]) +1 other test incomplete
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_evict@evict-beng-mixed-threads-large.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [INCOMPLETE][417] ([Intel XE#1473]) -> [FAIL][418] ([Intel XE#1000])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][419] ([Intel XE#1473]) -> [INCOMPLETE][420] ([Intel XE#1473])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [FAIL][421] ([Intel XE#1000]) -> [TIMEOUT][422] ([Intel XE#1473] / [Intel XE#2472])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_evict@evict-threads-large.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3859
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076 -> xe-pw-142746v1

  IGT_8160: 4f10d98c56498ab29445ae0b06aab6f5a8ec2eca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076: 39dcbfae0f6fcf74398f28d12bc24baab8f2e076
  xe-pw-142746v1: 142746v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/index.html

--===============5446727636625786755==
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
<tr><td><b>Series:</b></td><td>Check if is vblank too short</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142746/">https://patchwork.freedesktop.org/series/142746/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142746v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142746v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2392-39dcbfae0f6fcf74398f28d12bc24baab=
8f2e076_full -&gt; xe-pw-142746v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142746v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142746v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1427=
46v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_async_flips@test-time-sta=
mp.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@kms_atom=
ic@test-only.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_atomic@test-only.html">INCOM=
PLETE</a> +15 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outp=
uts:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746=
v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fen=
cing@1x-outputs.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_at=
omic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746=
v1/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@=
pipe-a-hdmi-a-6.html">INCOMPLETE</a> +30 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bm=
g-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">=
SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-c-dp-2.html">DMESG-FAIL</a> +43 other tests dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/=
shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-d=
-hdmi-a-6.html">DMESG-FAIL</a> +95 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_curs=
or_edge_walk@256x256-top-bottom@pipe-d-dp-2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@k=
ms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2.html">DMESG-FAIL</a> +52=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-panning@bd-hdmi-a6-dp4.html">FAIL</a> +654 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">FAIL</a> +669 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs-to-4.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/sh=
ard-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-6-4-mc-ccs=
-to-4.html">SKIP</a> +299 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_hdr@static-toggle-s=
uspend.html">DMESG-WARN</a> +27 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_plane_multiple@tiling-4@p=
ipe-b-dp-2.html">DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_pl=
ane_multiple@tiling-x@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@kms_plane=
_multiple@tiling-x@pipe-a-dp-4.html">DMESG-WARN</a> +27 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_psr2=
_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shar=
d-lnl-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-=
1.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_psr@=
fbc-psr-cursor-render@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_psr@fbc-psr-c=
ursor-render@edp-1.html">FAIL</a> +555 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_scal=
ing_modes@scaling-mode-center@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@km=
s_scaling_modes@scaling-mode-center@pipe-a-edp-1.html">INCOMPLETE</a> +38 o=
ther tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_pat@display-vs-wb-transien=
t.html">FAIL</a> +190 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-ln=
l-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">INCOMPLETE</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1=
/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_as=
ync_flips@crc-atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@km=
s_async_flips@crc-atomic.html">INCOMPLETE</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_asyn=
c_flips@crc-atomic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_as=
ync_flips@crc-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_atom=
ic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_big_=
fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@kms_big_=
fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/ig=
t@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_bi=
g_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms=
_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142746v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@km=
s_content_protection@mei-interface.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_conte=
nt_protection@uevent.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_curs=
or_edge_walk@128x128-left-edge@pipe-a-dp-2.html">TIMEOUT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/ig=
t@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-2.html">DMESG-FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">DMESG-FAIL</a> +2 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a>=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a>=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-=
bmg-1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">FA=
IL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/ig=
t@kms_flip@2x-nonexisting-fb-interruptible.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-=
draw-render.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_pl=
ane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_plane_cu=
rsor@overlay.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-=
dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_pm_dc@=
dc3co-vpb-simulation.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.htm=
l">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-l=
nl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">FAIL</a> +15=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">FAIL</a> +2 othe=
r tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg=
-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">FAIL</a> +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard=
-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">FAIL</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> +3 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_gt_fr=
eq@freq_suspend.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3859">Intel XE#3859</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_gt_freq@f=
req_suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142746v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_at=
omic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-4=
63/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/igt@kms_atom=
ic_transition@modeset-transition-fencing.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@kms_=
atomic_transition@modeset-transition-fencing.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-=
6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2613">Intel XE#2613</a>) +8 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_atomic_transition@plane-a=
ll-modeset-transition@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_chamelium_edid@dp-mode-ti=
mings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscree=
n-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_cursor_edge_walk@128x128-=
top-bottom.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_cu=
rsor_edge_walk@256x256-top-bottom.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_curso=
r_edge_walk@256x256-top-bottom.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-=
flipb-varying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@k=
ms_cursor_legacy@cursora-vs-flipb-varying-size.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#322=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@kms_flip@2x-fl=
ip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel X=
E#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_fl=
ip@plain-flip-ts-check@a-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip@plain=
-flip-ts-check@a-dp4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_fl=
ip@plain-flip-ts-check@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_flip@p=
lain-flip-ts-check@b-hdmi-a6.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-l=
nl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-linear.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/sha=
rd-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-lin=
ear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_pl=
ane@pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_plane@pixel-format.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_plan=
e@pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_plane@pixel-format.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_pl=
ane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@kms_plane@=
pixel-format-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a=
>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@kms_plan=
e@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-3/igt@kms_plane@pixe=
l-format-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_plane@pixel-format-source=
-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_plan=
e@plane-panning-bottom-right.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@kms_plane@plane-=
panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-=
bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2763">Intel XE#2763</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_pl=
ane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746=
v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixe=
l-format@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +4 other tests incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_plane_scaling@plane-scale=
r-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-d=
g2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/sh=
ard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@p=
ipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2566">Intel XE#2566</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-unity-scaling.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bm=
g-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2566">Intel XE#2566</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6/igt@kms_plan=
e_scaling@planes-scaler-unity-scaling@pipe-b.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/ig=
t@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-=
dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1=
/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-=
0-75@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/=
shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0=
-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2763">Intel XE#2763</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_eudebug@basic-vm-access-us=
erptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_evi=
ct@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_evict@=
evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-=
dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@reload.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@r=
eload-no-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_pm@=
s3-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_pm@s3-multiple-execs.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@k=
ms_setmode@invalid-clone-single-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_drm=
_fdinfo@utilization-single-full-load-isolation.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/=
igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_evi=
ct@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/=
igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-rebind-err.html">DMESG-WARN</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_=
exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-l=
nl-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2=
e076/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baa=
b8f2e076/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc2=
4baab8f2e076/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d1=
2bc24baab8f2e076/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f=
28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74=
398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6f=
cf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae=
0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dc=
bfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-=
39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e07=
6/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
746v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142746v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
746v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
746v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142746v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
746v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
746v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142746v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2=
e076/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baa=
b8f2e076/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc2=
4baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d1=
2bc24baab8f2e076/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f=
28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74=
398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6f=
cf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae=
0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dc=
bfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-=
39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e07=
6/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142746v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard=
-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8=
f2e076/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc2=
4baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f2=
8d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf7=
4398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0=
f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39d=
cbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-23=
92-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2=
e076/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24b=
aab8f2e076/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf74398f28d1=
2bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6fcf7439=
8f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbfae0f6f=
cf74398f28d12bc24baab8f2e076/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-39dcbf=
ae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2392-=
39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-463/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2746v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142746v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142746v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142746v1/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-1/igt@xe_pm@s3=
-mocs.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@xe_pm@s3-mocs.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-2/igt@xe_pm_re=
sidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-6/igt@xe_pm_reside=
ncy@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@xe_wedge=
d@basic-wedged.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@xe_wedged@basic-wedged.html">P=
ASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42746v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pi=
pe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/=
igt@kms_content_protection@content-type-change.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#271=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@k=
ms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 othe=
r test incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@kms_c=
ontent_protection@lic-type-0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-435/igt@kms=
_content_protection@lic-type-1.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-lnl-8/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-lnl-5/igt@kms_c=
ontent_protection@lic-type-1.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +2 other te=
sts incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-434/igt@kms_c=
ontent_protection@uevent.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-8/igt@kms_conte=
nt_protection@uevent.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@kms_curs=
or_edge_walk@128x128-left-edge.html">TIMEOUT</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/igt@kms_cursor_=
edge_walk@128x128-left-edge.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142746v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#=
2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142746v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142746v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2746v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-b=
mg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#10=
00</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-3/=
igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-7/igt@xe_evict=
@evict-beng-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-5/ig=
t@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-dg2-435/igt@xe_evi=
ct@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-dg2-=
463/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#14=
73</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076/shard-bmg-8/igt@xe_evict=
@evict-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142746v1/shard-bmg-1/igt@xe_evict@e=
vict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076 -&gt; xe-pw-142=
746v1</li>
</ul>
<p>IGT_8160: 4f10d98c56498ab29445ae0b06aab6f5a8ec2eca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2392-39dcbfae0f6fcf74398f28d12bc24baab8f2e076: 39dcbfae0f6fcf74398f28d=
12bc24baab8f2e076<br />
  xe-pw-142746v1: 142746v1</p>

</body>
</html>

--===============5446727636625786755==--
