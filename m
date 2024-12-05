Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EAAE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDD910EF68;
	Thu,  5 Dec 2024 18:20:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4E10EF68;
 Thu,  5 Dec 2024 18:20:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8378747474308179015=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_conver?=
 =?utf-8?q?t_intel=5Fdisplay=5Fdriver=2E=5Bch=5D_to_struct_intel=5Fdisplay_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 18:20:47 -0000
Message-ID: <173342284780.3009605.11249146064814991592@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204102150.2223455-1-jani.nikula@intel.com>
In-Reply-To: <20241204102150.2223455-1-jani.nikula@intel.com>
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

--===============8378747474308179015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert intel_display_driver.[ch] to struct intel_display (rev2)
URL   : https://patchwork.freedesktop.org/series/142102/
State : failure

== Summary ==

CI Bug Log - changes from xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd_full -> xe-pw-142102v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142102v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142102v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142102v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_vm@munmap-style-unbind-userptr-end:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-end.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-end.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][10] -> [FAIL][11] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][12] ([Intel XE#1231]) -> [DMESG-FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [FAIL][14] ([Intel XE#1000]) -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  
Known issues
------------

  Here are the changes found in xe-pw-142102v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#3467] / [Intel XE#3468])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2233])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#324])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_async_flips@crc:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#671]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_async_flips@crc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#1426]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2327]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#324])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1727] / [Intel XE#3468])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#787]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2252]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#373])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:
    - shard-bmg:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#3468]) +4 other tests dmesg-fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][48] ([Intel XE#3468]) +33 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2291]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#1475])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#323])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1340])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1727] / [Intel XE#3468])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1135])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][60] ([Intel XE#3468]) +1 other test dmesg-fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][61] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [ABORT][62] ([Intel XE#3468])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2316])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#3098])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][68] ([Intel XE#2635])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#2882])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#651])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#2953] / [Intel XE#3086])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#2333]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2352])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#653]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#656])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#1503])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_hdr@static-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#3468]) +21 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2763]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1489]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_psr@psr2-basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#899])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#756])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_writeback@writeback-check-output.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2905]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2322])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1392]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-bmg:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#1727])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_exec_fault_mode@once-basic-imm.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#288]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][100] ([Intel XE#358])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - shard-bmg:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#2705] / [Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][103] -> [DMESG-WARN][104] ([Intel XE#3086])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2229]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2457])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@blocking:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#3573])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_oa@blocking.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2284])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [ABORT][109] ([Intel XE#1616] / [Intel XE#1694])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][110] -> [ABORT][111] ([Intel XE#1794])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#944])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3467])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#1727] / [Intel XE#3467] / [Intel XE#3468]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][117] ([Intel XE#827]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#324]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          [FAIL][121] ([Intel XE#1701]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#1426]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][125] ([Intel XE#3468]) -> [PASS][126] +5 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_color@ctm-0-50:
    - shard-bmg:          [DMESG-WARN][127] ([Intel XE#2705]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_color@ctm-0-50.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_color@ctm-0-50.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][129] ([Intel XE#2291]) -> [PASS][130] +4 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#3086]) -> [PASS][132] +3 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][133] ([Intel XE#2316]) -> [PASS][134] +3 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_flip@2x-busy-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][135] ([Intel XE#2882]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][137] ([Intel XE#3468]) -> [PASS][138] +15 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [FAIL][139] ([Intel XE#3609]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pm_rpm@basic-pci-d3-state.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_universal_plane@universal-plane-sanity:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#877]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_universal_plane@universal-plane-sanity.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         [TIMEOUT][143] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][144] +4 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#1033]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [SKIP][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171]) ([Intel XE#2457]) -> ([PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@xe_module_load@many-reload.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-lnl:          [ABORT][199] -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-7/igt@xe_module_load@reload-no-display.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#2280] / [Intel XE#3468]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@bind-execqueues-independent:
    - shard-bmg:          [DMESG-WARN][203] -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_vm@bind-execqueues-independent.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3468]) -> [DMESG-FAIL][206] ([Intel XE#3468]) +4 other tests dmesg-fail
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#3086]) -> [FAIL][208] ([Intel XE#1231])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [TIMEOUT][209] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][210] ([Intel XE#3600])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#3468]) -> [DMESG-WARN][212] ([Intel XE#1727])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][213] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][214] ([Intel XE#3468]) +1 other test dmesg-warn
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_color@deep-color@pipe-a-dp-2-gamma:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-FAIL][216] ([Intel XE#3468] / [Intel XE#877])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][217] ([Intel XE#2291]) -> [DMESG-WARN][218] ([Intel XE#3468]) +1 other test dmesg-warn
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [DMESG-WARN][219] ([Intel XE#3468]) -> [DMESG-FAIL][220] ([Intel XE#2705] / [Intel XE#3468])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [DMESG-FAIL][221] ([Intel XE#3468]) -> [INCOMPLETE][222] ([Intel XE#1727] / [Intel XE#3468])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-FAIL][223] ([Intel XE#2705]) -> [DMESG-WARN][224] ([Intel XE#3468])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][225] ([Intel XE#2316]) -> [DMESG-WARN][226] ([Intel XE#3468]) +1 other test dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [SKIP][227] ([Intel XE#2316]) -> [ABORT][228] ([Intel XE#3468])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][229] ([Intel XE#2882] / [Intel XE#3098]) -> [FAIL][230] ([Intel XE#3098])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][231] -> [DMESG-WARN][232] ([Intel XE#3468])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][233] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) -> [DMESG-FAIL][234] ([Intel XE#324]) +1 other test dmesg-fail
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [DMESG-FAIL][235] ([Intel XE#3468]) -> [DMESG-WARN][236] ([Intel XE#3468]) +6 other tests dmesg-warn
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][237] ([Intel XE#2312]) -> [SKIP][238] ([Intel XE#2311]) +18 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][239] ([Intel XE#2333]) -> [INCOMPLETE][240] ([Intel XE#1727] / [Intel XE#2050])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [DMESG-FAIL][241] ([Intel XE#3468]) -> [FAIL][242] ([Intel XE#2333])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][243] ([Intel XE#2333]) -> [DMESG-FAIL][244] ([Intel XE#3468]) +1 other test dmesg-fail
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][245] ([Intel XE#2333]) -> [SKIP][246] ([Intel XE#2312]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][247] ([Intel XE#3468]) -> [SKIP][248] ([Intel XE#2312]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][249] ([Intel XE#2312]) -> [FAIL][250] ([Intel XE#2333]) +3 other tests fail
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][251] ([Intel XE#2312]) -> [DMESG-FAIL][252] ([Intel XE#3468])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [TIMEOUT][253] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][254] ([Intel XE#651])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][255] ([Intel XE#2311]) -> [SKIP][256] ([Intel XE#2312]) +17 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][257] ([Intel XE#2313]) -> [SKIP][258] ([Intel XE#2312]) +15 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][259] ([Intel XE#2312]) -> [SKIP][260] ([Intel XE#2313]) +20 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-bmg:          [DMESG-WARN][261] ([Intel XE#3468]) -> [DMESG-WARN][262] ([Intel XE#2705] / [Intel XE#3468])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-32:
    - shard-bmg:          [DMESG-WARN][263] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][264] ([Intel XE#3468]) +1 other test dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][265] ([Intel XE#1473]) -> [FAIL][266] ([Intel XE#1000])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#3467]) -> [DMESG-WARN][268] ([Intel XE#1727] / [Intel XE#3467])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][269] ([Intel XE#3343]) -> [DMESG-WARN][270] ([Intel XE#3343] / [Intel XE#3468])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][271] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][272] ([Intel XE#3467]) +1 other test dmesg-warn
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [ABORT][273] ([Intel XE#1616] / [Intel XE#3468]) -> [DMESG-FAIL][274] ([Intel XE#1727] / [Intel XE#3468])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_pm@s2idle-multiple-execs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          [DMESG-WARN][275] ([Intel XE#3468]) -> [DMESG-WARN][276] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_pm@s4-basic.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_pm@s4-basic.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][277] ([Intel XE#2919]) -> [DMESG-WARN][278] ([Intel XE#2919] / [Intel XE#3468])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_wedged@basic-wedged.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#3600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600
  [Intel XE#3609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3609
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/671
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd -> xe-pw-142102v2

  IGT_8138: 8138
  xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd: 320bf1795129fe4fb8127717e92289cd09ce0bfd
  xe-pw-142102v2: 142102v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/index.html

--===============8378747474308179015==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert intel_display_driv=
er.[ch] to struct intel_display (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142102/">https://patchwork.freedesktop.org/series/142102/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142102v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142102v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2324-320bf1795129fe4fb8127717e92289cd0=
9ce0bfd_full -&gt; xe-pw-142102v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142102v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142102v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
02v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-1/igt@km=
s_async_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_=
vblank@b-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-end:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_vm@mu=
nmap-style-unbind-userptr-end.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_vm@munmap-st=
yle-unbind-userptr-end.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-3/igt@km=
s_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel=
 XE#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142102v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_evict=
@evict-mixed-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_e=
vict@evict-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142102v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@core_hotunplug@hotreplug.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/s=
hard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdm=
i-a-1-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_asyn=
c_flips@crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_async_flips@crc.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/671">Inte=
l XE#671</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-7/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
102v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/ig=
t@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/sha=
rd-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/i=
gt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-=
a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-64x64@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms=
_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-ri=
ght-edge@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +33 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_curs=
or_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_cur=
sor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_draw_c=
rc@draw-method-blt@rgb565-4tiled.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@a=
b-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@a=
c-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tes=
ts dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@c=
d-dp2-hdmi-a3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip=
@basic-flip-vs-wf_vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_flip@b=
asic-flip-vs-wf_vblank@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_=
vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shar=
d-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-w=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_hdr@=
static-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_hdr@static-toggle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pipe=
_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_pipe_crc_basic=
@nonblocking-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +21 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_psr2_sf@psr2-cursor-plan=
e-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_psr@psr2-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@kms_writeback@writeback-check=
-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_evict@evict-small-multi-v=
m-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_exec_=
fault_mode@once-basic-imm.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_exec_fault_mode@=
once-basic-imm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefet=
ch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_exec_=
threads@threads-bal-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/ig=
t@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-a=
dlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_bo_ev=
ict_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_oa@blocking.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Int=
el XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1616">Intel XE#1616</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-6/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind=
-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_wedge=
d@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_wedged@wedged-mode-to=
ggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@core_hot=
unplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142102v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/ig=
t@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142102v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip=
-events@pipe-c-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outp=
uts:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-8/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">I=
ntel XE#1701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142102v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-n=
onblocking-fencing@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-5/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel =
XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142102v2/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-tran=
sition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/s=
hard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</=
a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_colo=
r@ctm-0-50.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_color@ctm-=
0-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +4 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_cur=
sor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v=
2/shard-adlp-6/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_flip=
@2x-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@kms_flip@2x-busy-=
flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_plan=
e_cursor@overlay@pipe-d-dp-2-size-64.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shar=
d-bmg-3/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html">PASS</a> +15=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pm_r=
pm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3609">Intel XE#3609</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@kms_pm_rp=
m@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_univ=
ersal_plane@universal-plane-sanity.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bm=
g-2/igt@kms_universal_plane@universal-plane-sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@sriov_b=
asic@enable-vfs-autoprobe-off@numvfs-all.html">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142102v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all=
.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@sriov_b=
asic@enable-vfs-autoprobe-off@numvfs-random.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd=
/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce=
0bfd/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd=
09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e922=
89cd09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717=
e92289cd09ce0bfd/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb812=
7717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4f=
b8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf1795129=
fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320bf179=
5129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-320b=
f1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2324-=
320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14210=
2v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142102v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14210=
2v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14210=
2v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14210=
2v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14210=
2v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142102v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@xe_modu=
le_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-a=
dlp-6/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-lnl-7/igt@xe_modul=
e_load@reload-no-display.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-lnl-5/igt@xe_module_load@relo=
ad-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-=
3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@xe_vm@bi=
nd-execqueues-independent.html">DMESG-WARN</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-3/igt@xe_vm@bind-ex=
ecqueues-independent.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_big_=
fb@x-tiled-16bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/ig=
t@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 o=
ther tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel X=
E#3086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142102v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0=
-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_big_fb@x-tiled=
-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3600">Intel XE#3600</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-1-displays-1920x1080p.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel X=
E#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-ti=
led-bmg-ccs@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_colo=
r@deep-color@pipe-a-dp-2-gamma.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102=
v2/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">I=
ntel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-b=
mg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg=
-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#270=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-8/igt@kms_=
draw_crc@draw-method-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/s=
hard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@kms_flip@2x=
-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bm=
g-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_flip=
@plain-flip-fb-recreate@d-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@kms_f=
lip@plain-flip-fb-recreate@d-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-adlp-6/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-v=
alid-mode.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_flip=
_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/ig=
t@kms_flip_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42102v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-=
draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2102v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-m=
ove.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-=
blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142102v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v=
2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Int=
el XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142102v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142102v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
02v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142102v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/s=
hard-bmg-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@kms_pm_r=
pm@universal-planes-dpms@plane-32.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2102v2/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-7/igt@xe_evict=
@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-1/igt@xe=
_evict@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">=
Intel XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142102v2/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-fun=
ction-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Inte=
l XE#3343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142102v2/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_guc_log_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-8/igt@xe_fault=
_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel X=
E#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142102v2/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-=
xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-3/igt@xe_pm@s2=
idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-5/=
igt@xe_pm@s2idle-multiple-execs.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-5/igt@xe_pm@s4=
-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-2/igt@xe_pm@s4-basic.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd/shard-bmg-1/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142102v2/shard-bmg-4/igt@xe_wedged@=
basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd -&gt; xe-pw-142=
102v2</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2324-320bf1795129fe4fb8127717e92289cd09ce0bfd: 320bf1795129fe4fb812771=
7e92289cd09ce0bfd<br />
  xe-pw-142102v2: 142102v2</p>

</body>
</html>

--===============8378747474308179015==--
