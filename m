Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2E4E77188
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jan 2025 20:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FD610E383;
	Sat,  4 Jan 2025 20:21:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4597F10E229;
 Sat,  4 Jan 2025 20:21:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6666115744716956452=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/cmtg=3A_Disable_t?=
 =?utf-8?q?he_CMTG_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Jan 2025 20:21:42 -0000
Message-ID: <173602210227.3306377.12688882875657968554@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250104172937.64015-1-gustavo.sousa@intel.com>
In-Reply-To: <20250104172937.64015-1-gustavo.sousa@intel.com>
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

--===============6666115744716956452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cmtg: Disable the CMTG (rev4)
URL   : https://patchwork.freedesktop.org/series/142946/
State : failure

== Summary ==

CI Bug Log - changes from xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10_full -> xe-pw-142946v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142946v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142946v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142946v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  
#### Warnings ####

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [INCOMPLETE][4] ([Intel XE#3864]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][6] ([Intel XE#1473]) -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [TIMEOUT][8] ([Intel XE#1473] / [Intel XE#2472]) -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  
Known issues
------------

  Here are the changes found in xe-pw-142946v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#3440])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@core_getversion@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][12] ([Intel XE#3914])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1885])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#3453])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2134]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@fbdev@eof.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@fbdev@eof.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1033])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2550]) +23 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3781])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#3908]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#367]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#367]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#3432])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +104 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2341])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2320]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#877])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2286])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#2141]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#2423])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dp_aux_dev.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2244])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#3288] / [Intel XE#3321])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#3321]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2597])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][59] -> [FAIL][60] ([Intel XE#3879]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][61] -> [INCOMPLETE][62] ([Intel XE#2597] / [Intel XE#2635])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#310])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2423] / [i915#2575]) +91 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_flip@busy-flip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2953]) +8 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#886]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#2351])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#656]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#2333]) +4 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2136]) +31 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#651]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2313]) +12 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2136]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1503])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_histogram@global-basic:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#3898])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_histogram@global-basic.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2763]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2763]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1131])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2446]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1489]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3414] / [Intel XE#3904])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2413])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic:
    - shard-bmg:          NOTRUN -> [FAIL][103] ([Intel XE#2883] / [Intel XE#3180])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1435])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][105] ([Intel XE#2883]) +2 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2450])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][107] -> [FAIL][108] ([Intel XE#771] / [Intel XE#899])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][109] -> [FAIL][110] ([Intel XE#899])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#899])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][113] ([Intel XE#3864]) +1 other test incomplete
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#756])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#756])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1280] / [Intel XE#455])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2905]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2905]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#688])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][120] ([Intel XE#2364])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#688])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1130]) +11 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#1130]) +182 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1392]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1392])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2322]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#288]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2905])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1192])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2284])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2284] / [Intel XE#366])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#584])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][134] -> [ABORT][135] ([Intel XE#1358] / [Intel XE#1607])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1794])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][138] -> [INCOMPLETE][139] ([Intel XE#3088]) +1 other test incomplete
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#3440]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@core_getversion@all-cards.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1885]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#2134]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@fbdev@write.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][147] ([Intel XE#1033]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][149] ([Intel XE#3908]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][151] -> [PASS][152] +4 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][153] ([Intel XE#877]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#301]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][157] ([Intel XE#3321]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][159] ([Intel XE#2882]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][161] ([Intel XE#2597]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][165] ([Intel XE#3288] / [Intel XE#3321]) -> [PASS][166] +2 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][167] ([Intel XE#2882] / [Intel XE#3288]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][170] +6 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2136]) -> [PASS][172] +24 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][173] ([Intel XE#1035]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#616]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2423] / [i915#2575]) -> [PASS][178] +83 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][179] ([Intel XE#2029]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2446]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][183] ([Intel XE#2883]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_setmode@basic.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][185] ([Intel XE#3864]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2423]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@testdisplay.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@testdisplay.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1130]) -> [PASS][190] +147 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#2953]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][193] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-2/igt@xe_pm@s4-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][195] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2423] / [i915#2575]) -> [SKIP][198] ([Intel XE#623])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][200] ([Intel XE#3781] / [Intel XE#3946])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_async_flips@crc-atomic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@crc-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][202] ([Intel XE#316])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#316]) -> [SKIP][204] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2136]) -> [SKIP][206] ([Intel XE#316]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#316]) -> [SKIP][208] ([Intel XE#2136]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][210] ([Intel XE#1124]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#619]) -> [SKIP][212] ([Intel XE#2136] / [Intel XE#2351])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1124]) -> [SKIP][214] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#2136]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2136]) -> [SKIP][218] ([Intel XE#1124]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423] / [i915#2575]) -> [SKIP][220] ([Intel XE#2191]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2191]) -> [SKIP][222] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#367]) -> [SKIP][224] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2423] / [i915#2575]) -> [SKIP][226] ([Intel XE#367]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2907]) -> [SKIP][228] ([Intel XE#2136]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][230] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][232] ([Intel XE#455] / [Intel XE#787])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][233] -> [INCOMPLETE][234] ([Intel XE#3862]) +1 other test incomplete
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [SKIP][236] ([Intel XE#2907]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136]) -> [SKIP][238] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][240] ([Intel XE#2136]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#314]) -> [SKIP][242] ([Intel XE#2136] / [Intel XE#2351])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2423] / [i915#2575]) -> [SKIP][244] ([Intel XE#306]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#306]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2423] / [i915#2575]) -> [SKIP][248] ([Intel XE#373]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#373]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][251] ([Intel XE#1178]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_content_protection@atomic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [FAIL][254] ([Intel XE#1178]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#307]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2423] / [i915#2575]) -> [SKIP][258] ([Intel XE#455]) +8 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#323]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#323]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#455]) -> [SKIP][264] ([Intel XE#2136] / [Intel XE#2351])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#455]) -> [SKIP][266] ([Intel XE#2351])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][268] ([Intel XE#455]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#1135])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][271] ([Intel XE#301]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#455]) -> [SKIP][274] ([Intel XE#2136]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#455]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#651]) -> [SKIP][278] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#658]) -> [SKIP][280] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][282] ([Intel XE#651]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#651]) -> [SKIP][284] ([Intel XE#2136]) +24 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#651]) +19 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#653]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][290] ([Intel XE#653]) +11 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#653]) -> [SKIP][292] ([Intel XE#2136]) +27 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2136]) -> [SKIP][294] ([Intel XE#653]) +18 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2927]) -> [SKIP][296] ([Intel XE#2136])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#346])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2423] / [i915#2575]) -> [SKIP][300] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#1122])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1129]) -> [SKIP][306] ([Intel XE#2136])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1129]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#1489]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1489]) -> [SKIP][312] ([Intel XE#2136]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1122]) -> [SKIP][314] ([Intel XE#2136])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][316] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][320] ([Intel XE#2136]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2351]) -> [SKIP][324] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][326] ([Intel XE#2351])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1127]) -> [SKIP][328] ([Intel XE#2423] / [i915#2575])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#3414]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][331] ([Intel XE#1729]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([Intel XE#330])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2168]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_vrr@cmrr.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_vrr@flipline.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [SKIP][340] ([Intel XE#756]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1130]) -> [SKIP][342] ([Intel XE#1280] / [Intel XE#455])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][344] ([Intel XE#1130])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1130]) -> [SKIP][346] ([Intel XE#1123])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#1126]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2905]) -> [SKIP][350] ([Intel XE#1130]) +13 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_eudebug@basic-close.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1130]) -> [SKIP][352] ([Intel XE#3889])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#3889]) -> [SKIP][354] ([Intel XE#1130])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][355] ([Intel XE#1600]) -> [SKIP][356] ([Intel XE#1130]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1130]) -> [TIMEOUT][358] ([Intel XE#1473] / [Intel XE#402])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#288]) -> [SKIP][360] ([Intel XE#1130]) +28 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1130]) -> [SKIP][362] ([Intel XE#288]) +23 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1130]) -> [SKIP][364] ([Intel XE#2360])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2360]) -> [SKIP][366] ([Intel XE#1130])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1130]) -> [SKIP][368] ([Intel XE#2905]) +9 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][370] ([Intel XE#1130]) +7 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1130]) -> [SKIP][372] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_oa@missing-sample-flags.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_oa@missing-sample-flags.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1130]) -> [SKIP][374] ([Intel XE#1337])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#979]) -> [SKIP][376] ([Intel XE#1130])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1130]) -> [SKIP][378] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][380] ([Intel XE#1130])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#1130]) -> [SKIP][382] ([Intel XE#944]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#944]) -> [SKIP][384] ([Intel XE#1130]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3180]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3180
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
  [Intel XE#3879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#3946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10 -> xe-pw-142946v4

  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10
  xe-pw-142946v4: 142946v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/index.html

--===============6666115744716956452==
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
<tr><td><b>Series:</b></td><td>drm/i915/cmtg: Disable the CMTG (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142946/">https://patchwork.freedesktop.org/series/142946/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10_full -&gt; xe-pw-142946v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142946v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142946v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142946v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864">Intel XE#3864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142946v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879">Intel XE#3879</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_histogram@global-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898">Intel XE#3898</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3180">Intel XE#3180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864">Intel XE#3864</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> +83 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-2/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864">Intel XE#3864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@testdisplay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +147 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_async_flips@crc-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946">Intel XE#3946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v4/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10 -&gt; xe-pw-142946v4</li>
</ul>
<p>IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2435-3491399dc8f0c0c3bcec5316c66e60f5f44e1f10: 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10<br />
  xe-pw-142946v4: 142946v4</p>

</body>
</html>

--===============6666115744716956452==--
