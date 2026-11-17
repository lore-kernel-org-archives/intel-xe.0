Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E9606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 05:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7BD10E479;
	Tue, 17 Nov 2026 05:00:47 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73CE10E40D;
 Tue, 17 Nov 2026 05:00:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8165627031103370003=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/backlight=3A_Keep?=
 =?utf-8?q?_ACPI_brightness_requests_while_the_display_is_off?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexis Calin via B4 Relay" <devnull+alexiscalin.protonmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 05:00:45 -0000
Message-ID: <179489164593.35214.9804993163272599697@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
In-Reply-To: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8165627031103370003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Keep ACPI brightness requests while the display is off
URL   : https://patchwork.freedesktop.org/series/178713/
State : failure

== Summary ==

CI Bug Log - changes from xe-6152-301355bfc109114743d4ce1d0512779923bbec0c_FULL -> xe-pw-178713v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-178713v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-178713v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-178713v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@xe_configfs@ctx-restore-post-bb:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@xe_configfs@ctx-restore-post-bb.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +13 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][8] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  
Known issues
------------

  Here are the changes found in xe-pw-178713v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#8749])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7059] / [Intel XE#7085])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7085])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5808]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#5851])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1477] / [Intel XE#7361])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7679]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7679])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5822]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5824])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2252])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6969]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#3304] / [Intel XE#7374])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#6707] / [Intel XE#7439]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5962]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#309] / [Intel XE#7343])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#9009])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8586])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_feature_discovery@dsc.html
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#9287])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#2316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#3098]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#6652]) +1 other test dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#301] / [Intel XE#3149])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7178])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7179])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4141]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5812]) +22 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#6312]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#7061])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7865])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7905]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][53] -> [ABORT][54] ([Intel XE#9362] / [Intel XE#9438]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7283])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8076])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#4596] / [Intel XE#5854])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#9779])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#9779]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#8399])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#1406])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2413])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6503])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#5948] / [Intel XE#9277])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][67] ([Intel XE#8868])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5764]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#7482])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7482])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322] / [Intel XE#7372])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5575] / [Intel XE#7484])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1392])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#8578])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#8374])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8589]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8374])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#8364]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8364]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#8369])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_reset@multi-queue-cancel.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8369])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8369])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#7098] / [Intel XE#8159])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#8589]) +130 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#8378])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#8378]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#8378]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5775])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6964])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_page_reclaim@random:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#7793])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_peer2peer@read.html
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#6588])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#5741])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2284] / [Intel XE#7370])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [PASS][97] -> [ABORT][98] ([Intel XE#9362])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][99] -> [FAIL][100] ([Intel XE#9254]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-config:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#6019])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#944])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#944])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][104] -> [FAIL][105] ([Intel XE#6569])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#8339])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-ptl:          [FAIL][107] ([Intel XE#6078]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][111] ([Intel XE#301]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][113] ([Intel XE#9313]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][115] ([Intel XE#1503]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010:
    - shard-bmg:          [FAIL][117] ([Intel XE#9780]) -> [PASS][118] +4 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][119] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [FAIL][121] -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-2/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-7/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [DMESG-WARN][123] ([Intel XE#7727]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-6/igt@xe_pm@s4-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-8/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [ABORT][125] ([Intel XE#9362]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-5/igt@xe_pm@s4-basic-exec.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_pm@s4-basic-exec.html
    - shard-lnl:          [ABORT][127] ([Intel XE#9362]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [DMESG-WARN][129] ([Intel XE#9391]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][131] ([Intel XE#6569]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][133] ([Intel XE#1124]) -> [SKIP][134] ([Intel XE#8589]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][135] ([Intel XE#2887]) -> [SKIP][136] ([Intel XE#8589]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][137] ([Intel XE#3432]) -> [SKIP][138] ([Intel XE#8589])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          [SKIP][139] ([Intel XE#9311]) -> [SKIP][140] ([Intel XE#8589])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_cdclk@mode-rejected-max-dotclock.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][141] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][142] ([Intel XE#8589])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][143] ([Intel XE#7358]) -> [SKIP][144] ([Intel XE#8589])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          [SKIP][145] ([Intel XE#2252]) -> [SKIP][146] ([Intel XE#8589])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-single.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [FAIL][147] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][148] ([Intel XE#8589])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][149] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][150] ([Intel XE#8589])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][151] ([Intel XE#1508]) -> [SKIP][152] ([Intel XE#8589])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][153] ([Intel XE#301]) -> [FAIL][154] ([Intel XE#301] / [Intel XE#3149])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][155] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][156] ([Intel XE#8589])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][157] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][158] ([Intel XE#8589])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][159] ([Intel XE#2311]) -> [SKIP][160] ([Intel XE#8589]) +10 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][161] ([Intel XE#4141]) -> [SKIP][162] ([Intel XE#8589]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][163] ([Intel XE#7061]) -> [SKIP][164] ([Intel XE#8589])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][165] ([Intel XE#2313]) -> [SKIP][166] ([Intel XE#8589]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][167] ([Intel XE#9346]) -> [FAIL][168] ([Intel XE#9319] / [Intel XE#9346])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][169] ([Intel XE#3544]) -> [SKIP][170] ([Intel XE#3374] / [Intel XE#3544])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][171] ([Intel XE#7283]) -> [SKIP][172] ([Intel XE#8589])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          [SKIP][173] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][174] ([Intel XE#8589]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_psr@pr-sprite-render.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][175] ([Intel XE#7795]) -> [SKIP][176] ([Intel XE#8589])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][177] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][178] ([Intel XE#8589])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][179] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][180] ([Intel XE#8589])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][181] ([Intel XE#1499] / [Intel XE#9271]) -> [SKIP][182] ([Intel XE#8589])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][183] ([Intel XE#6599]) -> [SKIP][184] ([Intel XE#8589])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_compute@eu-busy-10s.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_compute@eu-busy-10s.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          [SKIP][185] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][186] ([Intel XE#8589]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          [SKIP][187] ([Intel XE#8374]) -> [SKIP][188] ([Intel XE#8589])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@few-execs-userptr:
    - shard-bmg:          [SKIP][189] ([Intel XE#8364]) -> [SKIP][190] ([Intel XE#8589]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-userptr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][191] ([Intel XE#8369]) -> [SKIP][192] ([Intel XE#8589]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate:
    - shard-bmg:          [SKIP][193] ([Intel XE#8378]) -> [SKIP][194] ([Intel XE#8589]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          [SKIP][195] ([Intel XE#9203]) -> [SKIP][196] ([Intel XE#8589])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][197] ([Intel XE#7793]) -> [SKIP][198] ([Intel XE#8589])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@xe_page_reclaim@random.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][199] ([Intel XE#7695]) -> [SKIP][200] ([Intel XE#8589])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][201] ([Intel XE#944]) -> [SKIP][202] ([Intel XE#8589])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@xe_query@multigpu-query-gt-list.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391
  [Intel XE#9438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780


Build changes
-------------

  * IGT: IGT_9193 -> IGT_9194
  * Linux: xe-6152-301355bfc109114743d4ce1d0512779923bbec0c -> xe-pw-178713v1

  IGT_9193: 9193
  IGT_9194: 9194
  xe-6152-301355bfc109114743d4ce1d0512779923bbec0c: 301355bfc109114743d4ce1d0512779923bbec0c
  xe-pw-178713v1: 178713v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/index.html

--===============8165627031103370003==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Keep ACPI brightness requests while the display is off</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178713/">https://patchwork.freedesktop.org/series/178713/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6152-301355bfc109114743d4ce1d0512779923bbec0c_FULL -&gt; xe-pw-178713v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-178713v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-178713v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-178713v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@xe_configfs@ctx-restore-post-bb.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@dpms-lpsp:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178713v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ad-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438">Intel XE#9438</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-7/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948">Intel XE#5948</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +130 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588">Intel XE#6588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-2/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-7/igt@xe_exec_system_allocator@process-many-stride-mmap-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-6/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-5/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-2/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-ptl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391">Intel XE#9391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311">Intel XE#9311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-10/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-7/igt@xe_mempage_offline@inject-single-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-5/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6152-301355bfc109114743d4ce1d0512779923bbec0c/shard-bmg-9/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178713v1/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9193 -&gt; IGT_9194</li>
<li>Linux: xe-6152-301355bfc109114743d4ce1d0512779923bbec0c -&gt; xe-pw-178713v1</li>
</ul>
<p>IGT_9193: 9193<br />
  IGT_9194: 9194<br />
  xe-6152-301355bfc109114743d4ce1d0512779923bbec0c: 301355bfc109114743d4ce1d0512779923bbec0c<br />
  xe-pw-178713v1: 178713v1</p>

</body>
</html>

--===============8165627031103370003==--
