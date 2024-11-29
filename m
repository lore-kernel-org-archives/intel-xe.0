Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F6D735E6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 23:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFFE10E35C;
	Fri, 29 Nov 2024 23:31:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4F110E35C;
 Fri, 29 Nov 2024 23:31:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8797900617825802650=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/i915/display=3A_add_hdcp_sub-struct_to_struct_intel=5Fdi?=
 =?utf-8?q?gital=5Fport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 23:31:43 -0000
Message-ID: <173292310344.453109.11800522805049523185@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129112012.474228-1-jani.nikula@intel.com>
In-Reply-To: <20241129112012.474228-1-jani.nikula@intel.com>
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

--===============8797900617825802650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/display: add hdcp sub-struct to struct intel_digital_port
URL   : https://patchwork.freedesktop.org/series/141922/
State : failure

== Summary ==

CI Bug Log - changes from xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7_full -> xe-pw-141922v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141922v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141922v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141922v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-adlp:         [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  
Known issues
------------

  Here are the changes found in xe-pw-141922v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3560])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclose.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3467] / [Intel XE#3468])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1033]) +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#1426]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#3468]) +14 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1231]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#324])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2328])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#607])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +18 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2321]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][44] ([Intel XE#1727])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#877])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][49] ([Intel XE#3468]) +7 other tests dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1340]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [PASS][53] -> [DMESG-FAIL][54] ([Intel XE#2705])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2244]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#776])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#2882]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2316])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][62] ([Intel XE#3468]) +28 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][63] ([Intel XE#2705] / [Intel XE#3468])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#3097]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#886]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1874]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +30 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [PASS][75] -> [FAIL][76] ([Intel XE#1861])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#2333]) +9 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2312]) +10 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +26 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#3468])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2340])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#346]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2501])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:
    - shard-bmg:          [PASS][86] -> [INCOMPLETE][87] ([Intel XE#1727]) +1 other test incomplete
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1035] / [Intel XE#3468])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_plane@pixel-format.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_plane@pixel-format.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#1471])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_plane_cursor@overlay.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#1874])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2493])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#2571])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2763]) +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [PASS][98] -> [DMESG-WARN][99] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-bmg:          [PASS][100] -> [DMESG-WARN][101] ([Intel XE#2566])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#870]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2391])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#1430])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2505])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1489]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2414])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#3414]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2330])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#3468]) +100 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_sequence@get-idle.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][114] -> [FAIL][115] ([Intel XE#2883]) +2 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2883]) +2 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#1435])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2450])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#899]) +3 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][123] -> [DMESG-WARN][124] ([Intel XE#3086]) +5 other tests dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2168])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1499]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#1522]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1091] / [Intel XE#2849])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2905]) +10 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_eudebug@connect-user.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2322]) +12 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - shard-bmg:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#1727]) +3 other tests dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][134] ([Intel XE#3467])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][135] ([Intel XE#3343] / [Intel XE#3468])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][136] -> [DMESG-WARN][137] ([Intel XE#3467]) +1 other test dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][138] ([Intel XE#3467] / [Intel XE#3468])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][139] ([Intel XE#2998])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2229])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2833])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-bmg:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_oa@invalid-oa-format-id.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2284]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][145] -> [DMESG-WARN][146] ([Intel XE#3468] / [Intel XE#569])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][147] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_pm@s4-multiple-execs.html
    - shard-adlp:         [PASS][148] -> [ABORT][149] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][150] -> [FAIL][151] ([Intel XE#958])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#944]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [PASS][153] -> [FAIL][154] ([Intel XE#1081])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][155] ([Intel XE#2919])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-adlp:         [DMESG-WARN][156] ([Intel XE#3086]) -> [PASS][157] +5 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@core_hotunplug@unplug-rescan.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][158] ([Intel XE#1701]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][160] ([Intel XE#1874]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][162] ([Intel XE#3052]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][164] ([Intel XE#1231]) -> [PASS][165] +4 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][166] ([Intel XE#1231] / [Intel XE#3052]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][168] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][170] -> [PASS][171] +3 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_color@ctm-0-50:
    - shard-bmg:          [DMESG-WARN][172] ([Intel XE#3468] / [Intel XE#877]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_color@ctm-0-50.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_color@ctm-0-50.html

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][174] ([Intel XE#877]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][176] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][177] +2 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-lnl:          [FAIL][178] ([Intel XE#2577] / [Intel XE#3106]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][180] ([Intel XE#2291]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][182] ([Intel XE#2882]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][184] -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][186] ([Intel XE#2316]) -> [PASS][187] +4 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][190] ([Intel XE#886]) -> [PASS][191] +3 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][192] ([Intel XE#324]) -> [PASS][193] +5 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4:
    - shard-bmg:          [DMESG-WARN][194] -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][196] ([Intel XE#1861]) -> [PASS][197] +2 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-bmg:          [INCOMPLETE][198] -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_plane_cursor@viewport.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][200] ([Intel XE#718]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][202] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][204] ([Intel XE#1435]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-bmg:          [DMESG-FAIL][206] ([Intel XE#3468]) -> [PASS][207] +12 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_vblank@query-forked-busy-hang.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_vblank@query-forked-busy-hang.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#1727]) -> [PASS][209] +10 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][210] ([Intel XE#3605]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-lnl:          [FAIL][212] -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-bmg:          [INCOMPLETE][214] ([Intel XE#3592]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [DMESG-WARN][216] ([Intel XE#3468]) -> [PASS][217] +84 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_exec_threads@threads-cm-fd-userptr:
    - shard-bmg:          [INCOMPLETE][218] ([Intel XE#1169] / [Intel XE#2594]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-userptr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [DMESG-WARN][224] ([Intel XE#3467]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#3086] / [Intel XE#3343]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][228] ([Intel XE#1192]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][230] ([Intel XE#3625]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_module_load@reload.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_module_load@reload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [FAIL][232] ([Intel XE#2249]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [DMESG-WARN][234] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][235] +3 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_pm@d3hot-mocs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [DMESG-FAIL][236] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_pm@s2idle-mocs.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][238] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][240] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_pm@s3-basic.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_pm@s3-basic.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [FAIL][242] ([Intel XE#1081]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][244] ([Intel XE#2341]) -> [FAIL][245] ([Intel XE#1178])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][246] ([Intel XE#1178]) -> [SKIP][247] ([Intel XE#2341])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_content_protection@legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][248] ([Intel XE#1188]) -> [SKIP][249] ([Intel XE#2341])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_content_protection@uevent.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][250] ([Intel XE#2291]) -> [DMESG-WARN][251] ([Intel XE#3468])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][252] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][253] ([Intel XE#877])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][254] ([Intel XE#2291]) -> [DMESG-WARN][255] ([Intel XE#877])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [DMESG-WARN][256] ([Intel XE#3468]) -> [SKIP][257] ([Intel XE#2291])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][258] ([Intel XE#1695]) -> [DMESG-FAIL][259] ([Intel XE#3468])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][260] ([Intel XE#3468]) -> [FAIL][261] ([Intel XE#3321])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][262] ([Intel XE#3468]) -> [FAIL][263] ([Intel XE#2882])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][264] ([Intel XE#3468]) -> [DMESG-FAIL][265] ([Intel XE#3468]) +3 other tests dmesg-fail
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][266] ([Intel XE#2311]) -> [SKIP][267] ([Intel XE#2312]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2311]) +10 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][270] ([Intel XE#3468]) -> [FAIL][271] ([Intel XE#2333]) +8 other tests fail
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][272] ([Intel XE#2333]) -> [DMESG-FAIL][273] ([Intel XE#3468]) +9 other tests dmesg-fail
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [FAIL][274] ([Intel XE#2333]) -> [INCOMPLETE][275] ([Intel XE#3468])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][276] ([Intel XE#2333]) -> [INCOMPLETE][277] ([Intel XE#1727])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][278] ([Intel XE#2333]) -> [SKIP][279] ([Intel XE#2312]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][280] ([Intel XE#2312]) -> [DMESG-FAIL][281] ([Intel XE#3468])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][282] ([Intel XE#3468]) -> [SKIP][283] ([Intel XE#2312]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][284] ([Intel XE#2312]) -> [FAIL][285] ([Intel XE#2333]) +3 other tests fail
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][286] ([Intel XE#2313]) -> [SKIP][287] ([Intel XE#2312]) +9 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][288] ([Intel XE#2333]) -> [INCOMPLETE][289] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][290] ([Intel XE#2312]) -> [SKIP][291] ([Intel XE#2313]) +15 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][292] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][293] ([Intel XE#3544])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [DMESG-FAIL][294] ([Intel XE#3468]) -> [DMESG-WARN][295] ([Intel XE#3468])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_setmode@basic.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][296] ([Intel XE#3559]) -> [DMESG-WARN][297] ([Intel XE#3468]) +1 other test dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][298] ([Intel XE#1729]) -> [SKIP][299] ([Intel XE#2426])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][300] ([Intel XE#2509]) -> [SKIP][301] ([Intel XE#2426])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][302] ([Intel XE#1473]) -> [TIMEOUT][303] ([Intel XE#1473])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [DMESG-WARN][304] ([Intel XE#3468]) -> [DMESG-WARN][305] ([Intel XE#1727])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][306] ([Intel XE#1727]) -> [DMESG-WARN][307] ([Intel XE#3468])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][308] ([Intel XE#3343]) -> [DMESG-WARN][309] ([Intel XE#3343] / [Intel XE#3468])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [DMESG-WARN][310] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][311] ([Intel XE#3343]) +1 other test dmesg-warn
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [FAIL][312] ([Intel XE#3499]) -> [DMESG-FAIL][313] ([Intel XE#3467])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-FAIL][314] ([Intel XE#3467] / [Intel XE#3468]) -> [FAIL][315] ([Intel XE#3499]) +1 other test fail
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-FAIL][316] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-FAIL][317] ([Intel XE#3467])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][318] ([Intel XE#1192]) -> [INCOMPLETE][319] ([Intel XE#2998])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][320] ([Intel XE#2280] / [Intel XE#3468]) -> [DMESG-WARN][321] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][322] -> [ABORT][323] ([Intel XE#3421])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#3560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560
  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
  [Intel XE#3605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3605
  [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7 -> xe-pw-141922v1

  IGT_8131: f846ef8f7ddf051c88504c607136a9b5392bdef7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7: 4f5b3a832a6480c82639b5500d731d7222b7eee7
  xe-pw-141922v1: 141922v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html

--===============8797900617825802650==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/display: add hdcp sub-struct to struct intel_digital_port</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141922/">https://patchwork.freedesktop.org/series/141922/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7_full -&gt; xe-pw-141922v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141922v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141922v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141922v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_exec_balancer@twice-cm-virtual-basic.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141922v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3560">Intel XE#3560</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +14 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +28 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097">Intel XE#3097</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_sequence@get-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +100 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-7/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_oa@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_oa@invalid-oa-format-id.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-3/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@core_hotunplug@unplug-rescan.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_color@ctm-0-50.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_color@ctm-0-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_plane_cursor@viewport.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_vblank@query-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_vblank@query-forked-busy-hang.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3605">Intel XE#3605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592">Intel XE#3592</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_exec_reset@cm-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_threads@threads-cm-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625">Intel XE#3625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_pm@d3hot-mocs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_setmode@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Intel XE#3559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141922v1/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7 -&gt; xe-pw-141922v1</li>
</ul>
<p>IGT_8131: f846ef8f7ddf051c88504c607136a9b5392bdef7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2294-4f5b3a832a6480c82639b5500d731d7222b7eee7: 4f5b3a832a6480c82639b5500d731d7222b7eee7<br />
  xe-pw-141922v1: 141922v1</p>

</body>
</html>

--===============8797900617825802650==--
