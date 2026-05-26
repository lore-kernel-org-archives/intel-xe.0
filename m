Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1600CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 22:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7841010E55E;
	Tue, 26 May 2026 22:10:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF5D10E55E;
 Tue, 26 May 2026 22:10:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7897735082870049959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/display=3A_do_intel?=
 =?utf-8?q?=5Fdisplay=5Fpower=5F=7Bsuspend=2C_resume=7D=28=29_on_runtime_sus?=
 =?utf-8?q?pend/resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 22:10:55 -0000
Message-ID: <177983345576.13256.2909654994362546700@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526144937.1199524-1-jani.nikula@intel.com>
In-Reply-To: <20260526144937.1199524-1-jani.nikula@intel.com>
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

--===============7897735082870049959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: do intel_display_power_{suspend, resume}() on runtime suspend/resume
URL   : https://patchwork.freedesktop.org/series/167299/
State : failure

== Summary ==

CI Bug Log - changes from xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c_FULL -> xe-pw-167299v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167299v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167299v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167299v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@basic-rte:
    - shard-lnl:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [PASS][2] -> [ABORT][3] +13 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@d3hot-mocs:
    - shard-bmg:          [PASS][4] -> [ABORT][5] +14 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-2/igt@xe_pm@d3hot-mocs.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-6/igt@xe_pm@d3hot-mocs.html

  
#### Warnings ####

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][6] ([Intel XE#2029] / [Intel XE#7395]) -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][8] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][10] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][12] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          [SKIP][14] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) -> [ABORT][15] +1 other test abort
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          [SKIP][16] ([Intel XE#6813]) -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@kms_pm_rpm@package-g7.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          [SKIP][18] ([Intel XE#6814] / [Intel XE#7428]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-8/igt@kms_pm_rpm@package-g7.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][20] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) -> [ABORT][21] +2 other tests abort
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_pm@d3cold-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          [SKIP][22] ([Intel XE#5694] / [Intel XE#7370]) -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_pm@d3cold-i2c.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          [SKIP][24] ([Intel XE#5694] / [Intel XE#7370]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][26] ([Intel XE#2284] / [Intel XE#7370]) -> [ABORT][27] +2 other tests abort
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          [SKIP][28] ([Intel XE#584] / [Intel XE#7369]) -> [ABORT][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-3/igt@xe_pm@s3-d3hot-basic-exec.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-167299v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3279])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1407])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2327]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7679])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7676])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2887])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309] / [Intel XE#7343])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1137] / [Intel XE#2375])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7179])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6312]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7061] / [Intel XE#7356])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2311]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6312] / [Intel XE#651])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7905]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7865]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#5020] / [Intel XE#7348])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2234] / [Intel XE#2850])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_psr@pr-sprite-plane-move.html

  * igt@xe_eudebug@basic-client:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7636])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-read-event:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7636])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#6540] / [Intel XE#688])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7482])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_balancer@many-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322] / [Intel XE#7372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7136])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7136])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6874]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6874]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#7850])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-7/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-1/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:
    - shard-bmg:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#2594] / [Intel XE#8159])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-free-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-free-race.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7138])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7793])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pt-caching-update-pat-and-pte:
    - shard-bmg:          [PASS][72] -> [ABORT][73] ([Intel XE#7893])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@xe_pat@pt-caching-update-pat-and-pte.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-9/igt@xe_pat@pt-caching-update-pat-and-pte.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#944])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7174])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][76] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][78] ([Intel XE#301]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][80] ([Intel XE#6321]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [SKIP][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-5/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-3/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-3/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-5/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-8/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-8/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][131] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][132] ([Intel XE#2426] / [Intel XE#5848])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][133] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][134] ([Intel XE#2426] / [Intel XE#5848])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c -> xe-pw-167299v1

  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c
  xe-pw-167299v1: 167299v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/index.html

--===============7897735082870049959==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: do intel_display_power_{susp=
end, resume}() on runtime suspend/resume</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/167299/">https://patchwork.freedesktop.org/series/167299/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-167299v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-167299v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f=
121fb4c_FULL -&gt; xe-pw-167299v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167299v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-167299v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1672=
99v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_pm_rpm@basic-rte.html">AB=
ORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_pm@d3=
hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html">A=
BORT</a> +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-2/igt@xe_pm@d3=
hot-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-167299v1/shard-bmg-6/igt@xe_pm@d3hot-mocs.html">ABORT</a> +14=
 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@kms_p=
m_dc@deep-pkgc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167=
299v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">ABORT</a> +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-10/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16729=
9v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#8=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
7299v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">ABORT</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">In=
tel XE#7383</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.=
html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@kms_pm_rpm@packag=
e-g7.html">ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-8/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-6/igt@kms=
_pm_rpm@package-g7.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-=
1/igt@xe_pm@d3cold-basic.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_pm@d3=
cold-i2c.html">ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-6/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_pm@d3=
cold-i2c.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-7/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-5/i=
gt@xe_pm@d3cold-multiple-execs.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-3/igt@xe_pm@s3=
-d3hot-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@x=
e_pm@s3-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167299v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7676">Intel XE#7676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel =
XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12=
-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@kms_psr@pr-sprite-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_eudebug@basic-client.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_evict@evict-cm-threads-lar=
ge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_balancer@many-cm-virt=
ual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-7/igt@xe_exec_=
reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-1/ig=
t@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE=
#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-free-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-large-execqueues-free-race.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shar=
d-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-free-rac=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2594">Intel XE#2594</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-update-pat-and-pte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@xe_pat@p=
t-caching-update-pat-and-pte.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg-9/igt@xe_pat@pt-cachin=
g-update-pat-and-pte.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_sriov_admin@bulk-sched-pri=
ority-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
167299v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-bmg=
-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/sha=
rd-lnl-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121=
fb4c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717=
f121fb4c/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe3=
9717f121fb4c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1=
ebe39717f121fb4c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6=
cfb1ebe39717f121fb4c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02d=
ced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628c=
d02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d=
628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-1e5f=
bf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5132-=
1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-167299v1/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-167299v1/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167299v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167299v1/shar=
d-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-167299v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c -&gt; xe-pw-167=
299v1</li>
</ul>
<p>IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5132-1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c: 1e5fbf0d628cd02dced6cfb=
1ebe39717f121fb4c<br />
  xe-pw-167299v1: 167299v1</p>

</body>
</html>

--===============7897735082870049959==--
