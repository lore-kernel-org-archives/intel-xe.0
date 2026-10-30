Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 21:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C831129DF;
	Fri, 30 Oct 2026 21:11:22 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B41129DF;
 Fri, 30 Oct 2026 21:11:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8070592723041257035=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Frontbuffer_tracking_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 21:11:22 -0000
Message-ID: <179339468220.95928.2590595118360579258@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030070613.181026-1-jouni.hogander@intel.com>
In-Reply-To: <20261030070613.181026-1-jouni.hogander@intel.com>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8070592723041257035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Frontbuffer tracking fixes
URL   : https://patchwork.freedesktop.org/series/177219/
State : failure

== Summary ==

CI Bug Log - changes from xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b_FULL -> xe-pw-177219v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177219v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177219v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177219v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          [SKIP][3] ([Intel XE#2229]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
New tests
---------

  New tests have been introduced between xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b_FULL and xe-pw-177219v1_FULL:

### New IGT tests (3) ###

  * igt@xe_pm_residency@cpg-basic:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_pm_residency@cpg-gt-toggle:
    - Statuses : 3 pass(s)
    - Exec time: [1.05, 1.06] s

  * igt@xe_sriov_flr@flr-each-isolation:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 24.99] s

  

Known issues
------------

  Here are the changes found in xe-pw-177219v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan-with-load:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#8749])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@core_hotunplug@hotunplug-rescan-with-load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan-with-load.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#8589]) +121 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#6969]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304] / [Intel XE#7374])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2320])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1138] / [Intel XE#7344])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#8155]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-9/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4141]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5800] / [Intel XE#6312])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#6312] / [Intel XE#651])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7061])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7905]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2313]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5812]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#7061])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#9346])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8396]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#5849])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1489])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#1406])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1406])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][47] -> [FAIL][48] ([Intel XE#4227] / [Intel XE#7397])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1499] / [Intel XE#9271])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][50] -> [FAIL][51] ([Intel XE#6293] / [Intel XE#7397])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5764])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_evict@evict-beng-cm-threads-large.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6540] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2322] / [Intel XE#7372])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8374])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#9003])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8364]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#8364]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#8364]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8378]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6281] / [Intel XE#7426])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6964])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][64] -> [ABORT][65] ([Intel XE#9362]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-2/igt@xe_pm@s4-basic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][66] -> [ABORT][67] ([Intel XE#9362]) +2 other tests abort
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][68] ([Intel XE#367]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][70] ([Intel XE#7809]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [FAIL][72] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-2/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [ABORT][74] ([Intel XE#9362]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@xe_pm@s4-exec-after.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [ABORT][76] ([Intel XE#9362]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][78] ([Intel XE#1124]) -> [SKIP][79] ([Intel XE#8589]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][80] ([Intel XE#367]) -> [SKIP][81] ([Intel XE#8589])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][82] ([Intel XE#3432]) -> [SKIP][83] ([Intel XE#8589])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-bmg:          [SKIP][84] ([Intel XE#2887]) -> [SKIP][85] ([Intel XE#8589])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][86] ([Intel XE#7358]) -> [SKIP][87] ([Intel XE#8589]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          [SKIP][88] ([Intel XE#2252]) -> [SKIP][89] ([Intel XE#8589])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          [SKIP][90] ([Intel XE#9671]) -> [SKIP][91] ([Intel XE#8589])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][92] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][93] ([Intel XE#8589])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_content_protection@atomic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][94] ([Intel XE#2320]) -> [SKIP][95] ([Intel XE#8589])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][96] ([Intel XE#1508]) -> [SKIP][97] ([Intel XE#8589])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][98] ([Intel XE#8265]) -> [SKIP][99] ([Intel XE#8589])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][100] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][101] ([Intel XE#8589])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          [SKIP][102] ([Intel XE#8586]) -> [SKIP][103] ([Intel XE#8589])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_feature_discovery@dsc.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][104] ([Intel XE#4141]) -> [SKIP][105] ([Intel XE#8589]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][106] ([Intel XE#4141]) -> [DMESG-FAIL][107] ([Intel XE#7774])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][108] ([Intel XE#2311]) -> [SKIP][109] ([Intel XE#8589]) +12 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][110] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][111] ([Intel XE#8589])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][112] ([Intel XE#7061]) -> [SKIP][113] ([Intel XE#8589])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][114] ([Intel XE#2313]) -> [SKIP][115] ([Intel XE#8589]) +13 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][116] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][117] ([Intel XE#3544])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][118] ([Intel XE#6901]) -> [SKIP][119] ([Intel XE#8589])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][120] ([Intel XE#7283]) -> [SKIP][121] ([Intel XE#8589])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][122] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][123] ([Intel XE#8589])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][124] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][125] ([Intel XE#8589])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][126] ([Intel XE#1489]) -> [SKIP][127] ([Intel XE#8589]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][128] ([Intel XE#2234]) -> [SKIP][129] ([Intel XE#8589])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_psr@psr2-primary-render.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][130] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][131] ([Intel XE#8589])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][132] ([Intel XE#6503]) -> [SKIP][133] ([Intel XE#8589])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_sharpness_filter@filter-tap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][134] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][135] ([Intel XE#8589]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][136] ([Intel XE#8374]) -> [SKIP][137] ([Intel XE#8589]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:
    - shard-bmg:          [SKIP][138] ([Intel XE#8364]) -> [SKIP][139] ([Intel XE#8589]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][140] ([Intel XE#8378]) -> [SKIP][141] ([Intel XE#8589])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][142] ([Intel XE#7793]) -> [SKIP][143] ([Intel XE#8589])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-bmg:          [FAIL][144] ([Intel XE#9254]) -> [SKIP][145] ([Intel XE#8589])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          [SKIP][146] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][147] ([Intel XE#8589])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][148] ([Intel XE#944]) -> [SKIP][149] ([Intel XE#8589])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671


Build changes
-------------

  * Linux: xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b -> xe-pw-177219v1

  IGT_9171: 9171
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b
  xe-pw-177219v1: 177219v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/index.html

--===============8070592723041257035==
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
<tr><td><b>Series:</b></td><td>Frontbuffer tracking fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177219/">https://patchwork.freedesktop.org/series/177219/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b_FULL -&gt; xe-pw-177219v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177219v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-177219v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-177219v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b_FULL and xe-pw-177219v1_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-gt-toggle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.05, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 24.99] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177219v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@core_hotunplug@hotunplug-rescan-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan-with-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-9/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-2/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-2/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-ptl-8/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-ptl-5/igt@xe_pm@s4-exec-after.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-lnl-8/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@kms_sharpness_filter@filter-tap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v1/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b -&gt; xe-pw-177219v1</li>
</ul>
<p>IGT_9171: 9171<br />
  xe-6032-d8a353e238652bec29fd452babdaae0044d30b9b: d8a353e238652bec29fd452babdaae0044d30b9b<br />
  xe-pw-177219v1: 177219v1</p>

</body>
</html>

--===============8070592723041257035==--
