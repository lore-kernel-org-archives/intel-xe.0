Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F94EC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 08:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1921310E142;
	Tue,  4 Mar 2025 08:41:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8C810E142;
 Tue,  4 Mar 2025 08:41:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6031028948878209126=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pcode=3A_stop_loggi?=
 =?utf-8?q?ng_mailbox_status_as_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 08:41:50 -0000
Message-ID: <174107771086.479656.8674334685085659756@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304061727.452100-1-raag.jadav@intel.com>
In-Reply-To: <20250304061727.452100-1-raag.jadav@intel.com>
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

--===============6031028948878209126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pcode: stop logging mailbox status as error
URL   : https://patchwork.freedesktop.org/series/145746/
State : failure

== Summary ==

CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc_full -> xe-pw-145746v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145746v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145746v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145746v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-145746v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-lnl:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@fbdev@pan.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@fbdev@pan.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4330]) +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#3767]) +15 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4330])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +119 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#4417]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#4416]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4416]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#306]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2291]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2291]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4354])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][34] -> [SKIP][35] ([Intel XE#776]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-lnl:          [PASS][36] -> [SKIP][37] ([Intel XE#702])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_feature_discovery@display-1x.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#310])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#3321]) +5 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#3098])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][43] ([Intel XE#886])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][44] ([Intel XE#4330]) +29 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][45] ([Intel XE#4330])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#301]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#301]) +4 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#2482]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_flip@flip-vs-rmfb.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1397])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1401]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2311]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2312]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4141]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#656]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-lnl:          [PASS][64] -> [SKIP][65] ([Intel XE#2548]) +19 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#653]) +10 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2502])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#605])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3544])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#2568])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_invalid_mode@bad-hsync-start.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2934])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-lnl:          [PASS][74] -> [SKIP][75] ([Intel XE#4472]) +24 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#3380])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][78] ([Intel XE#324]) +11 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][79] ([Intel XE#324]) +1 other test dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#599]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2493])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][82] -> [SKIP][83] ([Intel XE#3307])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][86] -> [SKIP][87] ([Intel XE#2763]) +15 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2763]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-lnl:          [PASS][89] -> [SKIP][90] ([Intel XE#870])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_pm_backlight@bad-brightness.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [PASS][91] -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [PASS][93] -> [SKIP][94] ([Intel XE#1489]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1489]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1489]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [PASS][99] -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [PASS][101] -> [SKIP][102] ([Intel XE#4471]) +30 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#4330]) +7 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_sequence@get-busy.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_sequence@get-busy.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1499]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#455]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1123])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2905]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2905])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2322]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#1392]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#288]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2360])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][115] -> [FAIL][116] ([Intel XE#1999]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2541] / [Intel XE#3573])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2284])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         [PASS][119] -> [DMESG-WARN][120] ([Intel XE#4173]) +4 other tests dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][121] ([Intel XE#4330] / [Intel XE#569])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][122] ([Intel XE#4330] / [Intel XE#569])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#944]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#944])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4130])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4130])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#3342])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-lnl:          [SKIP][128] ([Intel XE#2134]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@fbdev@read.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@fbdev@read.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][130] ([Intel XE#4472]) -> [PASS][131] +27 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][134] -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][136] ([Intel XE#1511]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_color@deep-color.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-lnl:          [SKIP][138] -> [PASS][139] +10 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_color@degamma.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#4330]) -> [PASS][141] +18 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#309]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][144] ([Intel XE#2291]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#3009]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_aux_dev.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#4354]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [SKIP][150] ([Intel XE#1135]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feature_discovery@psr2.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#310]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][154] ([Intel XE#2316]) -> [PASS][155] +3 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][156] ([Intel XE#2882]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@busy-flip:
    - shard-lnl:          [SKIP][158] ([Intel XE#2482]) -> [PASS][159] +9 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip@busy-flip.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#2953]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][162] ([Intel XE#2955]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#4330]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][166] ([Intel XE#1745]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#656]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][170] ([Intel XE#2548]) -> [PASS][171] +25 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][172] ([Intel XE#2568]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_invalid_mode@bad-vtotal.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][174] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][175] +3 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [SKIP][176] ([Intel XE#2763]) -> [PASS][177] +21 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][178] ([Intel XE#870]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [DMESG-WARN][180] ([Intel XE#2042] / [Intel XE#4330]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [SKIP][182] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][184] ([Intel XE#1489]) -> [PASS][185] +3 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [SKIP][186] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][187] +9 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][188] ([Intel XE#1435]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setmode@basic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][190] ([Intel XE#1435]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][192] ([Intel XE#899]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-lnl:          [SKIP][194] ([Intel XE#4471]) -> [PASS][195] +14 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1392]) -> [PASS][197] +5 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][198] -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [SKIP][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225]) ([Intel XE#378]) -> ([PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][251] ([Intel XE#4173]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@xe_wedged@basic-wedged.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][253] ([Intel XE#4471]) -> [SKIP][254] ([Intel XE#664])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_interruptible@legacy-setmode:
    - shard-lnl:          [SKIP][255] ([Intel XE#4472]) -> [SKIP][256] ([Intel XE#4471]) +13 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_atomic_interruptible@legacy-setmode.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_atomic_interruptible@legacy-setmode.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-lnl:          [DMESG-WARN][257] ([Intel XE#324]) -> [SKIP][258] ([Intel XE#4472])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][259] ([Intel XE#4471]) -> [SKIP][260] ([Intel XE#1407]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][261] ([Intel XE#3658]) -> [SKIP][262] ([Intel XE#4471])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][263] ([Intel XE#3658]) -> [SKIP][264] ([Intel XE#4472])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          [SKIP][265] ([Intel XE#1407]) -> [SKIP][266] ([Intel XE#4471]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][267] ([Intel XE#1407]) -> [SKIP][268] ([Intel XE#4472])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          [SKIP][269] ([Intel XE#4472]) -> [SKIP][270] ([Intel XE#1407]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][271] ([Intel XE#1124]) -> [SKIP][272] ([Intel XE#4472]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          [SKIP][273] ([Intel XE#4472]) -> [SKIP][274] ([Intel XE#1467])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][275] ([Intel XE#1477]) -> [SKIP][276] ([Intel XE#4471])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][277] ([Intel XE#4330]) -> [DMESG-FAIL][278] ([Intel XE#2953] / [Intel XE#4330])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-lnl:          [SKIP][279] ([Intel XE#4471]) -> [SKIP][280] ([Intel XE#1124]) +5 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][281] ([Intel XE#4472]) -> [SKIP][282] ([Intel XE#1124]) +9 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][283] ([Intel XE#1124]) -> [SKIP][284] ([Intel XE#4471]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][285] ([Intel XE#1467]) -> [SKIP][286] ([Intel XE#4472])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          [SKIP][287] ([Intel XE#2191]) -> [SKIP][288] ([Intel XE#4471]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2191]) -> [DMESG-WARN][290] ([Intel XE#4330])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          [SKIP][291] ([Intel XE#4471]) -> [SKIP][292] ([Intel XE#2191])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          [SKIP][293] ([Intel XE#4472]) -> [SKIP][294] ([Intel XE#2191])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          [SKIP][295] ([Intel XE#1512]) -> [SKIP][296] ([Intel XE#4471])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][297] ([Intel XE#4472]) -> [SKIP][298] ([Intel XE#367])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][299] ([Intel XE#367]) -> [SKIP][300] ([Intel XE#4472])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([Intel XE#4471])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][303] ([Intel XE#4471]) -> [SKIP][304] ([Intel XE#1512])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          [SKIP][305] ([Intel XE#1512]) -> [SKIP][306] ([Intel XE#4472])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][307] ([Intel XE#455] / [Intel XE#787]) -> [INCOMPLETE][308] ([Intel XE#2594])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][309] ([Intel XE#2669]) -> [SKIP][310] ([Intel XE#4471]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][311] ([Intel XE#4471]) -> [SKIP][312] ([Intel XE#2887]) +6 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][313] ([Intel XE#2887]) -> [SKIP][314] ([Intel XE#4471]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#787]) -> [SKIP][316] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][317] ([Intel XE#3432]) -> [SKIP][318] ([Intel XE#4471]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][319] ([Intel XE#4471]) -> [SKIP][320] ([Intel XE#3432])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][321] ([Intel XE#4472]) -> [SKIP][322] ([Intel XE#3432])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][323] ([Intel XE#4472]) -> [SKIP][324] ([Intel XE#2887]) +11 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][326] ([Intel XE#787]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][327] ([Intel XE#2669]) -> [SKIP][328] ([Intel XE#4472])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][329] ([Intel XE#2705]) -> [DMESG-WARN][330] ([Intel XE#4330])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][331] ([Intel XE#2887]) -> [SKIP][332] ([Intel XE#4472]) +6 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][333] ([Intel XE#4417]) -> [SKIP][334] ([Intel XE#4471])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cdclk@mode-transition.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][335] ([Intel XE#4472]) -> [SKIP][336] ([Intel XE#4416])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          [SKIP][337] ([Intel XE#3278]) -> [SKIP][338] ([Intel XE#4472])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_content_protection@atomic-dpms.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          [SKIP][339] ([Intel XE#307]) -> [SKIP][340] ([Intel XE#4471])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          [SKIP][341] ([Intel XE#4472]) -> [SKIP][342] ([Intel XE#3278])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_content_protection@legacy.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][343] ([Intel XE#4471]) -> [SKIP][344] ([Intel XE#3278])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_content_protection@srm.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][345] ([Intel XE#4472]) -> [SKIP][346] ([Intel XE#2321])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][347] ([Intel XE#2321]) -> [SKIP][348] ([Intel XE#4472]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-lnl:          [SKIP][349] ([Intel XE#4471]) -> [SKIP][350] ([Intel XE#1424])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          [SKIP][351] ([Intel XE#1424]) -> [SKIP][352] ([Intel XE#4472]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][353] ([Intel XE#4471]) -> [SKIP][354] ([Intel XE#2321])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          [SKIP][355] ([Intel XE#1424]) -> [SKIP][356] ([Intel XE#4471]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          [SKIP][357] ([Intel XE#2321]) -> [SKIP][358] ([Intel XE#4471]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][359] ([Intel XE#4472]) -> [SKIP][360] ([Intel XE#1424]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][361] ([Intel XE#4472]) -> [SKIP][362] ([Intel XE#309]) +4 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][363] ([Intel XE#4471]) -> [SKIP][364] ([Intel XE#309]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-lnl:          [SKIP][365] ([Intel XE#323]) -> [SKIP][366] ([Intel XE#4472])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          [SKIP][367] ([Intel XE#309]) -> [SKIP][368] ([Intel XE#4471]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          [SKIP][369] ([Intel XE#309]) -> [SKIP][370] ([Intel XE#4472]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][371] ([Intel XE#4472]) -> [SKIP][372] ([Intel XE#323])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][373] ([Intel XE#4471]) -> [SKIP][374] ([Intel XE#4302])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][375] ([Intel XE#4354]) -> [SKIP][376] ([Intel XE#4472])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          [SKIP][377] ([Intel XE#4354]) -> [SKIP][378] ([Intel XE#4471])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][379] ([Intel XE#4294]) -> [SKIP][380] ([Intel XE#4471])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][381] ([Intel XE#4472]) -> [SKIP][382] ([Intel XE#2244])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@dsc-with-bpc.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][383] ([Intel XE#4471]) -> [SKIP][384] ([Intel XE#2244])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          [SKIP][385] ([Intel XE#4472]) -> [SKIP][386] ([Intel XE#4422])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][387] ([Intel XE#2955]) -> [SKIP][388] ([Intel XE#2316])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#310]) -> [DMESG-WARN][390] ([Intel XE#2955])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-dg2-set2:     [DMESG-WARN][391] ([Intel XE#4330]) -> [DMESG-FAIL][392] ([Intel XE#4330])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [SKIP][393] ([Intel XE#2482]) -> [FAIL][394] ([Intel XE#886])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
    - shard-bmg:          [DMESG-FAIL][395] ([Intel XE#4330]) -> [FAIL][396] ([Intel XE#2882])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@blocking-wf_vblank.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          [SKIP][397] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][398] ([Intel XE#1745]) +4 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][399] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][400] ([Intel XE#1745]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][401] ([Intel XE#1745]) -> [SKIP][402] ([Intel XE#1397] / [Intel XE#1745])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          [SKIP][403] ([Intel XE#1745]) -> [SKIP][404] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][405] ([Intel XE#2548]) -> [SKIP][406] ([Intel XE#651]) +14 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][407] ([Intel XE#2311]) -> [SKIP][408] ([Intel XE#2312]) +7 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][409] ([Intel XE#2312]) -> [SKIP][410] ([Intel XE#2311]) +11 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#651]) -> [SKIP][412] ([Intel XE#656]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][413] ([Intel XE#4330]) -> [SKIP][414] ([Intel XE#656])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][415] ([Intel XE#2312]) -> [SKIP][416] ([Intel XE#4141]) +5 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][417] ([Intel XE#656]) -> [SKIP][418] ([Intel XE#2548]) +50 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][419] ([Intel XE#2548]) -> [SKIP][420] ([Intel XE#656]) +42 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#4141]) -> [SKIP][422] ([Intel XE#2312]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][423] ([Intel XE#651]) -> [SKIP][424] ([Intel XE#2548]) +14 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#656]) -> [SKIP][426] ([Intel XE#651]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][427] ([Intel XE#2312]) -> [SKIP][428] ([Intel XE#2313]) +11 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#656]) -> [SKIP][430] ([Intel XE#653]) +5 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          [SKIP][431] ([Intel XE#1469]) -> [SKIP][432] ([Intel XE#2548])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#653]) -> [SKIP][434] ([Intel XE#656]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][435] ([Intel XE#2313]) -> [SKIP][436] ([Intel XE#2312]) +6 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][437] ([Intel XE#4472]) -> [SKIP][438] ([Intel XE#3374] / [Intel XE#3544])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][439] ([Intel XE#1503]) -> [SKIP][440] ([Intel XE#4472])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          [SKIP][441] ([Intel XE#1503]) -> [SKIP][442] ([Intel XE#4471])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_hdr@static-swap.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][443] ([Intel XE#4472]) -> [SKIP][444] ([Intel XE#1503])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][445] ([Intel XE#324]) -> [SKIP][446] ([Intel XE#3380])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][447] ([Intel XE#3380]) -> [DMESG-FAIL][448] ([Intel XE#324])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane@plane-position-hole.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [SKIP][449] ([Intel XE#3380]) -> [DMESG-WARN][450] ([Intel XE#324])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][451] ([Intel XE#4472]) -> [SKIP][452] ([Intel XE#599])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][453] ([Intel XE#599]) -> [SKIP][454] ([Intel XE#4471])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][455] ([Intel XE#4361]) -> [DMESG-WARN][456] ([Intel XE#4330])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][457] ([Intel XE#736]) -> [SKIP][458] ([Intel XE#1122])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][459] ([Intel XE#2861]) -> [FAIL][460] ([Intel XE#2029])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][461] ([Intel XE#2893]) -> [SKIP][462] ([Intel XE#1489]) +4 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][463] ([Intel XE#1489]) -> [SKIP][464] ([Intel XE#2893]) +6 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          [SKIP][465] ([Intel XE#1128]) -> [SKIP][466] ([Intel XE#1122])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          [SKIP][467] ([Intel XE#1406]) -> [SKIP][468] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][469] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][470] ([Intel XE#1406]) +6 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@pr-primary-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          [SKIP][471] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][472] ([Intel XE#4472]) +2 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][473] ([Intel XE#4472]) -> [SKIP][474] ([Intel XE#3414] / [Intel XE#3904])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][475] ([Intel XE#1127]) -> [SKIP][476] ([Intel XE#4472])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][477] ([Intel XE#4471]) -> [SKIP][478] ([Intel XE#4472]) +34 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          [SKIP][479] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][480] ([Intel XE#4471]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][481] ([Intel XE#4472]) -> [SKIP][482] ([Intel XE#362])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][483] ([Intel XE#1499]) -> [SKIP][484] ([Intel XE#4471])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_vrr@negative-basic.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][485] ([Intel XE#4472]) -> [SKIP][486] ([Intel XE#1499])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2861
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471
  [Intel XE#4472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -> xe-pw-145746v1

  IGT_8257: 8257
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf891368b75a67e8700dc
  xe-pw-145746v1: 145746v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/index.html

--===============6031028948878209126==
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
<tr><td><b>Series:</b></td><td>drm/xe/pcode: stop logging mailbox status as=
 error</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145746/">https://patchwork.freedesktop.org/series/145746/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145746v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145746v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67=
e8700dc_full -&gt; xe-pw-145746v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145746v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145746v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1457=
46v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@system-suspend-modeset:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_pm_r=
pm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_pm_rpm@system-s=
uspend-modeset.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145746v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@fbdev@pa=
n.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-145746v1/shard-lnl-1/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2=
-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +119 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cdclk@plane-scaling@pipe-=
b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor=
_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_feat=
ure_discovery@display-1x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_feature_discover=
y@display-1x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip@2x-absolu=
te-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@basic-flip-vs-wf_v=
blank@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@a=
-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_flip@flip-vs-absolute-w=
f_vblank-interruptible@d-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +29 other t=
ests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@c-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_fli=
p@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_flip=
@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_flip@flip-vs-rmfb.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482"=
>Intel XE#2482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@km=
s_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a=
>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_inva=
lid_mode@bad-hsync-start.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_invalid_mode@bad=
-hsync-start.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_pipe=
_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pipe_c=
rc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +24 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane@plane-position-hole=
-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +11 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_plane@plane-position-hole=
@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane_lowres@tiling-none@=
pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plan=
e_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_plane_scali=
ng@invalid-num-scalers.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1=
/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-fo=
rmat@pipe-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sha=
rd-lnl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_pm_b=
acklight@bad-brightness.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pm_backlight@bad-=
brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_pm_r=
pm@dpms-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/i=
gt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip=
</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_psr@=
psr2-sprite-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_psr@psr2-sprite-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_ro=
tation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +30 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_sequ=
ence@get-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_sequence@get-busy.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4330">Intel XE#4330</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests sk=
ip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_eudebug_online@writes-ca=
ching-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@x=
e_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@xe_pm@s=
2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-u=
serptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_query@multigpu-query-confi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
fair-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@fbdev@re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@fbdev@read.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/ig=
t@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +27 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145746v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1=
/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdm=
i-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1511">Intel XE#1511</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_color@deep-col=
or.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_colo=
r@degamma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_color@degamma.html">PASS</a> +1=
0 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463=
/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_dp_aux_dev.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_feature_=
discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_fli=
p@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_fli=
p@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-2/i=
gt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@busy-flip.h=
tml">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adl=
p-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@single-buffer-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-dg2-464/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_flip_scaled_crc@fl=
ip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> =
+2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-=
upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#25=
48</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5746v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-f=
ullscreen.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_inva=
lid_mode@bad-vtotal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_invalid=
_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_pl=
ane_scaling@plane-scaler-unity-scaling-with-rotation.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel =
XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-=
unity-scaling-with-rotation.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel=
 XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145746v1/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-c=
lamping-pixel-formats.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_pm_ba=
cklight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_pm=
_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-dg2-464/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard=
-lnl-8/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/s=
hard-lnl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@=
psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_psr=
@psr-no-drrs.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setm=
ode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_setmode@basic.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl=
-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vbla=
nk@ts-continuation-dpms-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms=
_vblank@ts-continuation-dpms-rpm.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a> +5 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1=
/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_c=
reate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e=
8700dc/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b=
75a67e8700dc/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf=
891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292c=
a26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a=
93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf=
56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-27=
52-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e87=
00dc/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75=
a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891=
368b75a67e8700dc/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26=
fbf891368b75a67e8700dc/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a932=
92ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e=
26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-=
1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5746v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145746v1/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45746v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145746v1/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@xe_wedg=
ed@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-adlp-2/igt@xe_wedge=
d@basic-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_asyn=
c_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_=
async_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_atom=
ic_interruptible@legacy-setmode.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/ig=
t@kms_atomic_interruptible@legacy-setmode.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +13 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746=
v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE=
#3658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145746v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel =
XE#3658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145746v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_=
fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_=
big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_big_=
fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms=
_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl=
-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#447=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4=
330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45746v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-=
hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_=
big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@km=
s_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms=
_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/=
shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4330">Intel XE#4330</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191=
">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191=
">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sh=
ard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_bw@l=
inear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/ig=
t@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_bw@l=
inear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/ig=
t@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@l=
inear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/=
igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_bw@l=
inear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/=
igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_ccs=
@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@=
bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/ig=
t@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl=
-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sha=
rd-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">=
Intel XE#4471</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145746v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tile=
d-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard=
-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Inte=
l XE#4471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-ln=
l-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-=
lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel =
XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shar=
d-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-145746v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_ccs@=
random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/ig=
t@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/s=
hard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
30">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_ccs@=
random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/=
igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4417">Intel XE#4417</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_cdclk@mod=
e-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_=
content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/ig=
t@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@km=
s_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_curs=
or_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@km=
s_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_curs=
or_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@k=
ms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_curs=
or_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-=
1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/=
igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14574=
6v1/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel =
XE#4472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145746v1/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_dp_li=
nk_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_dsc@dsc-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v=
1/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_f=
lip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-463/igt@kms_flip@=
2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-432/=
igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
@blocking-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_flip@bl=
ocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@blocking-wf_vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-bmg-4/igt@kms_f=
lip@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel =
XE#1401</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile=
-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">I=
ntel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-145746v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32=
bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel X=
E#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5746v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-d=
raw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2548">Intel XE#2548</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145746v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145=
746v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145746v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
46v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_hdr@static-swap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_plan=
e@plane-position-covered.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@km=
s_plane@plane-position-covered.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plan=
e@plane-position-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_plane=
@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e@plane-position-hole-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_=
plane@plane-position-hole-dpms.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plan=
e_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_plane_=
lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_plane_lowre=
s@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_pl=
ane_multiple@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4361">Intel XE#4361</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-dg2-464/igt@k=
ms_plane_multiple@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_pm_dc@=
dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2861">Intel XE#2861</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@kms_pm_dc@deep-pkgc=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-ln=
l-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@k=
ms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_psr@=
fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_ps=
r@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@=
pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-8/igt@kms_=
psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_rota=
tion_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-7/i=
gt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-5/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-4/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-ln=
l-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4=
472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl=
-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#447=
2</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_rota=
tion_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shar=
d-lnl-1/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/sha=
rd-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">I=
ntel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-3/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-1/igt@kms_vrr@negative=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4471">Intel XE#4471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145746v1/shard-lnl-6/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -&gt; xe-pw-145=
746v1</li>
</ul>
<p>IGT_8257: 8257<br />
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf89=
1368b75a67e8700dc<br />
  xe-pw-145746v1: 145746v1</p>

</body>
</html>

--===============6031028948878209126==--
