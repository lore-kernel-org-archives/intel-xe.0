Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF77CD2A530
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 16:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AFA10E747;
	Wed, 16 Oct 2024 16:34:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFC710E747;
 Wed, 16 Oct 2024 16:34:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3493059122510190120=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/lspcon=3A_do_not_hardc?=
 =?utf-8?q?ode_settle_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 16:34:06 -0000
Message-ID: <172909644604.1274866.1422894790836877967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014093914.109162-1-giedriuswork@gmail.com>
In-Reply-To: <20241014093914.109162-1-giedriuswork@gmail.com>
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

--===============3493059122510190120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/lspcon: do not hardcode settle timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/139997/
State : failure

== Summary ==

CI Bug Log - changes from xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557_full -> xe-pw-139997v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139997v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139997v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139997v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - {shard-bmg}:        [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  
Known issues
------------

  Here are the changes found in xe-pw-139997v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11] ([Intel XE#1195]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#827])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][14] ([Intel XE#877])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1231])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1477])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +48 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#307])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1188]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#308])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#309])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#309])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1475])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#1620]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#3070])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#776])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#701])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#310]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#301])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1421]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#2882]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#2049])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#886]) +3 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +16 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#653]) +14 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#455]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][61] -> [DMESG-FAIL][62] ([Intel XE#324]) +2 other tests dmesg-fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#324]) +6 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#2566]) +1 other test incomplete
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#870])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#908])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1489])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1489]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_psr@psr2-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#899])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#2443]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +15 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1123])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1123])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-adlp:         [PASS][80] -> [FAIL][81] ([Intel XE#2667])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#2905])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2905])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2905]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#688])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][86] -> [TIMEOUT][87] ([Intel XE#1473])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#261] / [Intel XE#688])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1392]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#2754])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#288]) +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#288]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2360]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][96] ([Intel XE#2105])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2229])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#1999]) +2 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#2514])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2541]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#2541])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][102] ([Intel XE#1173]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2284] / [Intel XE#366])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [PASS][104] -> [DMESG-FAIL][105] ([Intel XE#1033] / [Intel XE#1727])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@xe_pm@s3-exec-after.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][106] -> [ABORT][107] ([Intel XE#1358] / [Intel XE#1607])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@xe_pm@s4-basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#579])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#944])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#944])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][111] -> [PASS][112] +3 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#324]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [FAIL][119] -> [PASS][120] +2 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][121] ([Intel XE#301]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - {shard-bmg}:        [FAIL][123] -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][125] ([Intel XE#2882]) -> [PASS][126] +2 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][127] ([Intel XE#886]) -> [PASS][128] +6 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][129] ([Intel XE#301]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#2953]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][133] ([Intel XE#1874]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - {shard-bmg}:        [INCOMPLETE][135] ([Intel XE#2566]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][137] ([Intel XE#2029]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-lnl:          [INCOMPLETE][139] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-lnl:          [DMESG-FAIL][141] ([Intel XE#1620]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][143] ([Intel XE#2948]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][145] ([Intel XE#2883]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#2883]) -> [PASS][148] +6 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][149] ([Intel XE#2883]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][151] ([Intel XE#899]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][153] ([Intel XE#1523]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_vblank@accuracy-idle.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][155] ([Intel XE#2443]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_vrr@max-min.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_vrr@max-min.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [FAIL][157] ([Intel XE#2667]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][159] ([Intel XE#1473]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#1000]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][163] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][165] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [ABORT][167] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s3-basic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][169] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [ABORT][171] ([Intel XE#2625]) -> [PASS][172] +3 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][173] ([Intel XE#958]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][175] ([Intel XE#1033] / [Intel XE#1727]) -> [DMESG-FAIL][176] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) +1 other test dmesg-fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][177] ([Intel XE#1231]) -> [DMESG-FAIL][178] ([Intel XE#324]) +1 other test dmesg-fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][179] ([Intel XE#324]) -> [FAIL][180] ([Intel XE#1231])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         [SKIP][181] ([Intel XE#455] / [Intel XE#787]) -> [TIMEOUT][182] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests timeout
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][183] ([Intel XE#1195] / [Intel XE#1727]) -> [INCOMPLETE][184] ([Intel XE#1727])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][185] ([Intel XE#1861]) -> [TIMEOUT][186] ([Intel XE#1033] / [Intel XE#1727])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][187] ([Intel XE#656]) -> [TIMEOUT][188] ([Intel XE#1033] / [Intel XE#1727])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][189] ([Intel XE#1035] / [Intel XE#1195]) -> [INCOMPLETE][190] ([Intel XE#1035])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_plane@pixel-format.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#1729]) -> [SKIP][192] ([Intel XE#362])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][193] ([Intel XE#1473]) -> [FAIL][194] ([Intel XE#1000])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557 -> xe-pw-139997v2

  IGT_8075: 8075
  xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557: 0bebd793802b4eae14c71400e833cda8f91b0557
  xe-pw-139997v2: 139997v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/index.html

--===============3493059122510190120==
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
<tr><td><b>Series:</b></td><td>drm/i915/lspcon: do not hardcode settle timeout (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139997/">https://patchwork.freedesktop.org/series/139997/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557_full -&gt; xe-pw-139997v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139997v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139997v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139997v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139997v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-8/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@xe_pm@s3-exec-after.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-3/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-433/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-464/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139997v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557 -&gt; xe-pw-139997v2</li>
</ul>
<p>IGT_8075: 8075<br />
  xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557: 0bebd793802b4eae14c71400e833cda8f91b0557<br />
  xe-pw-139997v2: 139997v2</p>

</body>
</html>

--===============3493059122510190120==--
