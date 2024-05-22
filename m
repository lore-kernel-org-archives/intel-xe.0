Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04CEC25B74
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 00:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0127810E1C7;
	Wed, 22 May 2024 00:58:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8A10E1C7;
 Wed, 22 May 2024 00:58:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5351887791503531544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_flush_gtt_before_sign?=
 =?utf-8?q?alling_user_fence_on_media_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 00:58:51 -0000
Message-ID: <171633953129.2165722.11596252407093127167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
In-Reply-To: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
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

--===============5351887791503531544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: flush gtt before signalling user fence on media engines
URL   : https://patchwork.freedesktop.org/series/133884/
State : failure

== Summary ==

CI Bug Log - changes from xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad_full -> xe-pw-133884v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133884v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133884v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133884v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-adlp:         NOTRUN -> [ABORT][1] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_color@ctm-negative:
    - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +4 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_color@ctm-negative.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_color@ctm-negative.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-adlp:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][7] ([Intel XE#1201] / [Intel XE#316]) -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {shard-lnl}:        NOTRUN -> [ABORT][9] +5 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - {shard-lnl}:        NOTRUN -> [FAIL][10] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - {shard-lnl}:        [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_rpm@legacy-planes:
    - {shard-lnl}:        NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-2/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html

  
Known issues
------------

  Here are the changes found in xe-pw-133884v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][16] ([Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#660])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#873])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#610])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1231]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1874]) +8 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +12 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#346])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367]) +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#1252])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#787]) +104 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][38] ([Intel XE#1850])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][39] ([Intel XE#1713])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#314])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#373]) +13 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@ctm-negative@pipe-c:
    - shard-dg2-set2:     [PASS][47] -> [DMESG-WARN][48] ([Intel XE#1214])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_color@ctm-negative@pipe-c.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_color@ctm-negative@pipe-c.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#307])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][55] ([Intel XE#1214] / [Intel XE#1608])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#323])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#282]) +3 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#776])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1137] / [Intel XE#1201])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1137] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#310]) +10 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][70] ([Intel XE#1162] / [Intel XE#1214])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#1195]) +2 other tests incomplete
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#455]) +31 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][73] ([Intel XE#324]) +6 other tests dmesg-fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#651]) +23 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][76] ([Intel XE#1861]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1151] / [Intel XE#1201])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#658])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#656]) +54 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#417])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#1201] / [Intel XE#455])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][87] -> [DMESG-WARN][88] ([Intel XE#1162]) +1 other test dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#616]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#305]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#305]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#455]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#836])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#929]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1122] / [Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#929]) +16 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1149] / [Intel XE#1201])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1127] / [Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1127] / [Intel XE#1201])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1195])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][114] ([Intel XE#1174])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#362])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][116] -> [FAIL][117] ([Intel XE#771] / [Intel XE#899])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][118] -> [FAIL][119] ([Intel XE#899])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-dg2-set2:     [PASS][120] -> [ABORT][121] ([Intel XE#1205])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_universal_plane@universal-plane-functional.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_universal_plane@universal-plane-functional.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_writeback@writeback-check-output.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#1050])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1123] / [Intel XE#1201])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1123])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1126] / [Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][131] -> [TIMEOUT][132] ([Intel XE#1473] / [Intel XE#402])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][133] -> [TIMEOUT][134] ([Intel XE#1473] / [Intel XE#392])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-small-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#1392]) +14 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#288])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#288]) +25 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         NOTRUN -> [FAIL][142] ([Intel XE#1068])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-rebind:
    - shard-dg2-set2:     [PASS][143] -> [FAIL][144] ([Intel XE#1256]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [PASS][145] -> [DMESG-WARN][146] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1192] / [Intel XE#1201])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#378])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#1337])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1061] / [Intel XE#1201])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1008] / [Intel XE#1201])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_pm@d3-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#366])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][153] ([Intel XE#1195])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][154] ([Intel XE#1191] / [Intel XE#1214]) +6 other tests dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][155] ([Intel XE#1214]) +1 other test dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][156] ([Intel XE#1195] / [Intel XE#1358])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][157] -> [DMESG-WARN][158] ([Intel XE#1214])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1201] / [Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][161] ([Intel XE#1760])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@unused-pitches:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [i915#6077]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][165] +3 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - {shard-lnl}:        [INCOMPLETE][166] ([Intel XE#1602] / [Intel XE#1760]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201]) -> [PASS][169] +11 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][170] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][174] ([Intel XE#282]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_draw_crc@draw-method-mmap-wc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         [ABORT][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [ABORT][180] -> [PASS][181] +7 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - {shard-lnl}:        [SKIP][182] ([Intel XE#1134]) -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_invalid_mode@bad-vtotal:
    - {shard-lnl}:        [SKIP][184] ([Intel XE#1733]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_invalid_mode@bad-vtotal.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][186] ([Intel XE#1874]) -> [PASS][187] +3 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-adlp:         [SKIP][188] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_pm_rpm@dpms-lpsp.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#1600]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_atomic@basic-inc-all:
    - {shard-lnl}:        [SKIP][194] ([Intel XE#1699]) -> [PASS][195] +15 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_exec_atomic@basic-inc-all.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-8/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:
    - {shard-lnl}:        [DMESG-FAIL][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_threads@threads-userptr:
    - {shard-lnl}:        [ABORT][198] -> [PASS][199] +4 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-4/igt@xe_exec_threads@threads-userptr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@xe_exec_threads@threads-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
    - shard-adlp:         [SKIP][202] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@xe_live_ktest@xe_bo.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - {shard-lnl}:        [SKIP][204] ([Intel XE#1192]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][206] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@xe_pm@s2idle-basic.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][208] ([Intel XE#1694]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][210] ([Intel XE#1214]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][212] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_vm@large-userptr-split-binds-33554432:
    - {shard-lnl}:        [SKIP][214] ([Intel XE#1130] / [Intel XE#1699]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_vm@large-userptr-split-binds-33554432.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@xe_vm@large-userptr-split-binds-33554432.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [INCOMPLETE][216] ([Intel XE#1195] / [Intel XE#1667]) -> [DMESG-WARN][217] ([Intel XE#1214] / [Intel XE#1667])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [INCOMPLETE][218] ([Intel XE#1195] / [Intel XE#1365]) -> [ABORT][219] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#455])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][223] ([Intel XE#316]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][225] ([Intel XE#610])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][227] ([Intel XE#1124])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][228] ([Intel XE#1231]) -> [DMESG-FAIL][229] ([Intel XE#324]) +1 other test dmesg-fail
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][231] ([Intel XE#1124]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][233] ([Intel XE#619])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1124]) -> [SKIP][235] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][237] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#367]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#367])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][241] ([Intel XE#367]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][243] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1252]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#1252])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][249] ([Intel XE#787]) +41 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#787]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#829])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][257] ([Intel XE#306])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][259] ([Intel XE#373]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#373]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#308]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][267] ([Intel XE#455]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [INCOMPLETE][268] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][269] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][270] ([Intel XE#1195]) -> [DMESG-WARN][271] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [DMESG-WARN][272] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][273] ([Intel XE#282])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201]) -> [DMESG-WARN][275] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-dg2-set2:     [DMESG-WARN][276] ([Intel XE#282]) -> [DMESG-WARN][277] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#1226])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [i915#3804]) -> [SKIP][281] ([i915#3804])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-adlp:         [ABORT][282] -> [SKIP][283] ([Intel XE#1201] / [Intel XE#310])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][285] ([Intel XE#1195] / [Intel XE#927])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1201]) -> [INCOMPLETE][287] ([Intel XE#1195])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][289] ([Intel XE#1195])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][293] ([Intel XE#651]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][295] ([Intel XE#658])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1201]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#651]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1201]) -> [SKIP][301] ([Intel XE#653])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][303] ([Intel XE#653]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#653]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1201]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-suspend.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [FAIL][308] ([Intel XE#581]) -> [FAIL][309] ([Intel XE#616])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_plane_cursor@primary.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [FAIL][310] ([Intel XE#361]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#455])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [FAIL][312] ([Intel XE#361]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#455])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][315] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [INCOMPLETE][316] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][317] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][318] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][319] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][321] ([Intel XE#305] / [Intel XE#455]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1201]) -> [SKIP][323] ([Intel XE#305] / [Intel XE#455])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][325] ([Intel XE#305]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#870]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#870])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1201]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#870])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][331] ([Intel XE#870])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][333] ([Intel XE#1122])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1201]) -> [SKIP][335] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][337] ([Intel XE#929]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#929]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][341] ([Intel XE#1127])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vblank@wait-idle:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1201]) -> [SKIP][343] ([Intel XE#1201] / [Intel XE#1226])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_vblank@wait-idle.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_vblank@wait-idle.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#455]) -> [SKIP][345] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_vrr@seamless-rr-switch-vrr.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1201]) -> [SKIP][347] ([Intel XE#756])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#756]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#756])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][351] ([Intel XE#1091])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][353] ([Intel XE#1126])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#288]) -> [SKIP][355] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][357] ([Intel XE#288]) +16 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#366]) -> [SKIP][359] ([Intel XE#1201] / [Intel XE#366])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][360] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][361] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [INCOMPLETE][362] ([Intel XE#1195] / [Intel XE#1694]) -> [DMESG-WARN][363] ([Intel XE#1214] / [Intel XE#1608])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][365] ([Intel XE#366])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][366] ([Intel XE#1162] / [Intel XE#1551]) -> [DMESG-WARN][367] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1551])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][369] ([Intel XE#579])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][371] ([Intel XE#944]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@xe_query@multigpu-query-config.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#944]) -> [SKIP][373] ([Intel XE#1201] / [Intel XE#944])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1713]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1713
  [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7865 -> IGT_7866
  * Linux: xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad -> xe-pw-133884v1

  IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad: 39e2349c88dab7b39cf2c9549783e9b1e03311ad
  xe-pw-133884v1: 133884v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/index.html

--===============5351887791503531544==
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
<tr><td><b>Series:</b></td><td>drm/xe: flush gtt before signalling user fence on media engines</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133884/">https://patchwork.freedesktop.org/series/133884/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad_full -&gt; xe-pw-133884v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133884v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133884v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133884v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_color@ctm-negative.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-8bpp-rotate-90:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@core_hotunplug@unbind-rebind.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-2/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133884v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850">Intel XE#1850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1713">Intel XE#1713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_color@ctm-negative@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_color@ctm-negative@pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_universal_plane@universal-plane-functional.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_universal_plane@universal-plane-functional.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_pm@d3-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_addfb_basic@unused-pitches.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_draw_crc@draw-method-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733">Intel XE#1733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@kms_invalid_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_exec_atomic@basic-inc-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-8/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-4/igt@xe_exec_threads@threads-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@xe_exec_threads@threads-userptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-4/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-33554432:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_vm@large-userptr-split-binds-33554432.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699">Intel XE#1699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-lnl-4/igt@xe_vm@large-userptr-split-binds-33554432.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667">Intel XE#1667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667">Intel XE#1667</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717">Intel XE#1717</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_vblank@wait-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_vblank@wait-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-432/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133884v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7865 -&gt; IGT_7866</li>
<li>Linux: xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad -&gt; xe-pw-133884v1</li>
</ul>
<p>IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad: 39e2349c88dab7b39cf2c9549783e9b1e03311ad<br />
  xe-pw-133884v1: 133884v1</p>

</body>
</html>

--===============5351887791503531544==--
