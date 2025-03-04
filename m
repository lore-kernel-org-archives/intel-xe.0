Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A50C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 12:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F25B10E595;
	Tue,  4 Mar 2025 12:12:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B410E595;
 Tue,  4 Mar 2025 12:12:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5680443115245200525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PMU_support_for_function_e?=
 =?utf-8?q?ngine_activity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 12:12:10 -0000
Message-ID: <174109033055.586116.7308896385441996149@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304095743.3274062-1-riana.tauro@intel.com>
In-Reply-To: <20250304095743.3274062-1-riana.tauro@intel.com>
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

--===============5680443115245200525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PMU support for function engine activity
URL   : https://patchwork.freedesktop.org/series/145755/
State : failure

== Summary ==

CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc_full -> xe-pw-145755v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145755v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145755v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145755v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@xe_exec_balancer@once-cm-virtual-basic:
    - shard-dg2-set2:     [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exec_balancer@once-cm-virtual-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exec_balancer@once-cm-virtual-basic.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-dg2-set2:     [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-145755v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4173]) +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@core_hotunplug@hotrebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/igt@core_hotunplug@hotrebind.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#4330]) +10 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4330])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#610])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +10 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +184 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][26] ([Intel XE#4199])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][27] ([Intel XE#4330]) +26 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3432])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2724])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4416]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4416]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#2953])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#877])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2291]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#309])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1508])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#4302])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([i915#3804])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4354])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2244])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4422])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#310]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#3321]) +4 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#301]) +3 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2316]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2316]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301]) +5 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][69] ([Intel XE#4330]) +2 other tests dmesg-fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#4330]) +5 other tests dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_flip@flip-vs-panning-vs-hang.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1397]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +27 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4141]) +13 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#656]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2312]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +26 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2502])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3374] / [Intel XE#3544])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1450]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2934]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][88] ([Intel XE#324]) +12 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][89] ([Intel XE#324]) +1 other test dmesg-fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#599]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2393])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2493])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2763]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1489]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1489])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#3414] / [Intel XE#3904])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2330])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2426])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][101] ([Intel XE#4459])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1499]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#3889])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2905]) +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1392]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2322]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#288]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#1999]) +2 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2248])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2245])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2284]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][114] ([Intel XE#4330] / [Intel XE#569])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][115] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#579])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#944]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4130]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3342])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-misaligned-binds-33554432:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][121] ([Intel XE#4330])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_vm@large-split-misaligned-binds-33554432.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-lnl:          [SKIP][122] ([Intel XE#2134]) -> [PASS][123] +2 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@fbdev@read.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@fbdev@read.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][124] ([Intel XE#4472]) -> [PASS][125] +52 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#2191]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#3124]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][134] ([Intel XE#1511]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_color@deep-color.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-lnl:          [SKIP][136] -> [PASS][137] +18 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_color@degamma.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#4330]) -> [PASS][139] +6 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#309]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][142] ([Intel XE#2291]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][144] ([Intel XE#4471]) -> [PASS][145] +38 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#3009]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_aux_dev.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_dp_aux_dev.html
    - shard-lnl:          [SKIP][148] ([Intel XE#3009]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_aux_dev.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#4354]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][152] ([Intel XE#1135]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feature_discovery@psr1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#301]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][156] ([Intel XE#2955]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#310]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#3098]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][162] ([Intel XE#2316]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [DMESG-FAIL][164] ([Intel XE#4330]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@blocking-wf_vblank.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][166] ([Intel XE#2882]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][168] ([Intel XE#2882]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][170] ([Intel XE#2953]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#2955]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [SKIP][174] ([Intel XE#2482]) -> [PASS][175] +16 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][176] ([Intel XE#1745]) -> [PASS][177] +4 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#4330]) -> [PASS][179] +3 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#656]) -> [PASS][181] +3 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][182] ([Intel XE#2548]) -> [PASS][183] +45 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][184] ([Intel XE#2568]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_invalid_mode@bad-vtotal.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][186] ([Intel XE#3380]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-lnl:          [SKIP][188] ([Intel XE#2763]) -> [PASS][189] +37 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][190] ([Intel XE#870]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [SKIP][192] ([Intel XE#1129]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [SKIP][194] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][196] ([Intel XE#1489]) -> [PASS][197] +4 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [SKIP][198] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][199] +16 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][200] ([Intel XE#2939]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][202] ([Intel XE#1435]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setmode@basic.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][204] ([Intel XE#899]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1392]) -> [PASS][207] +6 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][208] -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [SKIP][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230]) ([Intel XE#2457]) -> ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][250] ([Intel XE#4471]) -> [SKIP][251] ([Intel XE#664])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-lnl:          [SKIP][252] ([Intel XE#4471]) -> [DMESG-WARN][253] ([Intel XE#324])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_atomic@plane-cursor-legacy.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][254] ([Intel XE#4471]) -> [SKIP][255] ([Intel XE#1407]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][256] ([Intel XE#4471]) -> [SKIP][257] ([Intel XE#3658])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][258] ([Intel XE#4472]) -> [SKIP][259] ([Intel XE#1407]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][260] ([Intel XE#4471]) -> [SKIP][261] ([Intel XE#1124]) +11 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          [SKIP][262] ([Intel XE#4472]) -> [SKIP][263] ([Intel XE#1467])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][264] ([Intel XE#4472]) -> [SKIP][265] ([Intel XE#1428])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][266] ([Intel XE#4471]) -> [SKIP][267] ([Intel XE#1477])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][268] ([Intel XE#4472]) -> [SKIP][269] ([Intel XE#1124]) +12 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          [SKIP][270] ([Intel XE#4471]) -> [SKIP][271] ([Intel XE#2191])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          [SKIP][272] ([Intel XE#4472]) -> [SKIP][273] ([Intel XE#2191]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          [SKIP][274] ([Intel XE#4472]) -> [SKIP][275] ([Intel XE#1512])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][276] ([Intel XE#4472]) -> [SKIP][277] ([Intel XE#367])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][278] ([Intel XE#4471]) -> [SKIP][279] ([Intel XE#367]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][280] ([Intel XE#4471]) -> [SKIP][281] ([Intel XE#1512])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][282] ([Intel XE#4471]) -> [SKIP][283] ([Intel XE#2887]) +13 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#787]) -> [SKIP][285] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][286] ([Intel XE#4471]) -> [SKIP][287] ([Intel XE#3432])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][288] ([Intel XE#4472]) -> [SKIP][289] ([Intel XE#3432]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][290] ([Intel XE#4472]) -> [SKIP][291] ([Intel XE#2887]) +15 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][293] ([Intel XE#787]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][294] ([Intel XE#2705]) -> [INCOMPLETE][295] ([Intel XE#2705] / [Intel XE#3113])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][296] -> [INCOMPLETE][297] ([Intel XE#3113])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][298] ([Intel XE#4472]) -> [SKIP][299] ([Intel XE#4416])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          [SKIP][300] ([Intel XE#4471]) -> [SKIP][301] ([Intel XE#3278]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_content_protection@content-type-change.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          [SKIP][302] ([Intel XE#4472]) -> [SKIP][303] ([Intel XE#3278]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_content_protection@legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][304] ([Intel XE#4471]) -> [SKIP][305] ([Intel XE#1468])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_content_protection@mei-interface.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][306] ([Intel XE#4472]) -> [SKIP][307] ([Intel XE#2321])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][308] ([Intel XE#4471]) -> [SKIP][309] ([Intel XE#2321])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          [SKIP][310] ([Intel XE#4471]) -> [SKIP][311] ([Intel XE#1424]) +5 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][312] ([Intel XE#4472]) -> [SKIP][313] ([Intel XE#1424]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][314] ([Intel XE#4472]) -> [SKIP][315] ([Intel XE#309]) +6 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][316] ([Intel XE#4471]) -> [SKIP][317] ([Intel XE#309]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-lnl:          [SKIP][318] ([Intel XE#4472]) -> [SKIP][319] ([Intel XE#323]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][320] ([Intel XE#4471]) -> [SKIP][321] ([Intel XE#4302])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][322] ([Intel XE#4471]) -> [SKIP][323] ([Intel XE#4354])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][324] ([Intel XE#4472]) -> [SKIP][325] ([Intel XE#4331])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][326] ([Intel XE#4472]) -> [SKIP][327] ([Intel XE#2244])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@dsc-with-bpc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][328] ([Intel XE#4471]) -> [SKIP][329] ([Intel XE#2244]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          [SKIP][330] ([Intel XE#4472]) -> [SKIP][331] ([Intel XE#4422])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#310]) -> [DMESG-WARN][333] ([Intel XE#2955])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][334] ([Intel XE#1745]) -> [SKIP][335] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][336] ([Intel XE#1745]) -> [SKIP][337] ([Intel XE#1401] / [Intel XE#1745]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][338] ([Intel XE#2548]) -> [SKIP][339] ([Intel XE#651]) +27 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#651]) -> [SKIP][341] ([Intel XE#656]) +5 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][342] ([Intel XE#4330]) -> [SKIP][343] ([Intel XE#656])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][344] ([Intel XE#2312]) -> [SKIP][345] ([Intel XE#4141]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#656]) -> [DMESG-WARN][347] ([Intel XE#4330])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][348] ([Intel XE#2548]) -> [SKIP][349] ([Intel XE#656]) +74 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][350] ([Intel XE#4141]) -> [SKIP][351] ([Intel XE#2312]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#656]) -> [SKIP][353] ([Intel XE#651]) +11 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][354] ([Intel XE#2311]) -> [SKIP][355] ([Intel XE#2312]) +8 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][356] ([Intel XE#2312]) -> [SKIP][357] ([Intel XE#2311]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][358] ([Intel XE#2312]) -> [SKIP][359] ([Intel XE#2313]) +5 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][360] ([Intel XE#2313]) -> [SKIP][361] ([Intel XE#2312]) +9 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#653]) -> [SKIP][363] ([Intel XE#656]) +10 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#656]) -> [SKIP][365] ([Intel XE#653]) +9 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][366] ([Intel XE#4472]) -> [SKIP][367] ([Intel XE#3374] / [Intel XE#3544])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][368] ([Intel XE#4471]) -> [SKIP][369] ([Intel XE#1503])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][370] ([Intel XE#4472]) -> [SKIP][371] ([Intel XE#1503])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          [SKIP][372] ([Intel XE#2568]) -> [SKIP][373] ([Intel XE#1450] / [Intel XE#2568])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][374] ([Intel XE#3380]) -> [DMESG-FAIL][375] ([Intel XE#324])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane@plane-position-hole.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [SKIP][376] ([Intel XE#3380]) -> [DMESG-WARN][377] ([Intel XE#324])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][378] ([Intel XE#4472]) -> [SKIP][379] ([Intel XE#599])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][380] ([Intel XE#4471]) -> [SKIP][381] ([Intel XE#599])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][382] ([Intel XE#4361]) -> [DMESG-WARN][383] ([Intel XE#4330])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][384] ([Intel XE#2861]) -> [FAIL][385] ([Intel XE#2029])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][386] ([Intel XE#1489]) -> [SKIP][387] ([Intel XE#2893]) +10 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          [SKIP][388] ([Intel XE#1122]) -> [SKIP][389] ([Intel XE#1128]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][390] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][391] ([Intel XE#1406]) +13 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr@pr-primary-blt.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][392] ([Intel XE#4471]) -> [SKIP][393] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][394] ([Intel XE#4472]) -> [SKIP][395] ([Intel XE#3414] / [Intel XE#3904])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][396] ([Intel XE#4471]) -> [SKIP][397] ([Intel XE#1127]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1500]) -> [SKIP][399] ([Intel XE#362])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-lnl:          [SKIP][400] ([Intel XE#4472]) -> [SKIP][401] ([Intel XE#362])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-lnl:          [SKIP][402] ([Intel XE#4471]) -> [FAIL][403] ([Intel XE#4459])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@cmrr.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          [SKIP][404] ([Intel XE#4471]) -> [SKIP][405] ([Intel XE#1499])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@lobf.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][406] ([Intel XE#4472]) -> [SKIP][407] ([Intel XE#1499])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
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
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
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
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471
  [Intel XE#4472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -> xe-pw-145755v1

  IGT_8257: 8257
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf891368b75a67e8700dc
  xe-pw-145755v1: 145755v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/index.html

--===============5680443115245200525==
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
<tr><td><b>Series:</b></td><td>PMU support for function engine activity</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145755/">https://patchwork.freedesktop.org/series/145755/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145755v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145755v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2752-1cf56e26a93292ca26fbf891368b75a67=
e8700dc_full -&gt; xe-pw-145755v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145755v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145755v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1457=
55v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sh=
ard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downsc=
aling.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@km=
s_setmode@invalid-clone-single-crtc-stealing.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_setmode@invalid-clone-s=
ingle-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">DMESG-WARN</a> +1 other test=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exe=
c_balancer@once-cm-virtual-basic.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exec_ba=
lancer@once-cm-virtual-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exe=
c_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exe=
c_threads@threads-bal-mixed-fd-basic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_liv=
e_ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">SKI=
P</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145755v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@core_ho=
tunplug@hotrebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/igt@core_hotunplug@hotrebind.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2=
-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +184 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4199">Intel XE#4199</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +26 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cdclk@plane-scaling@pipe-=
b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rando=
m-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_flip@2x-absolu=
te-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt=
@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank=
-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 other tests =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_flip=
@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_flip@flip-vs-pan=
ning-vs-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +5 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-=
464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">I=
ntel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_plane@plane-position-hole=
-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +12 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane@plane-position-hole=
@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-pla=
ne-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_psr@fbc-psr-primary-pag=
e-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4459">Intel XE#4459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-463/igt@x=
e_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-33554432:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_vm@large-split-misaligned-=
binds-33554432.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
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
g/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@fbdev@read.html">PASS</a> +2=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/ig=
t@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +52 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html=
">PASS</a></li>
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
intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145755v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1511">Intel XE#1511</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_color@deep-col=
or.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_colo=
r@degamma.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_color@degamma.html">PASS</a> +1=
8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433=
/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varyin=
g-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471=
">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cur=
sor-atomic-transitions-varying-size.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_dp_aux_dev.html"=
>PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_feature_=
discovery@psr1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard=
-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_f=
lip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_fli=
p@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#309=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145=
755v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-hdmi=
-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@blocking-wf_vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_f=
lip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-6/igt@kms_fli=
p@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adlp-8/i=
gt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@kms_flip=
@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@kms_f=
lip@blocking-wf_vblank@b-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-adl=
p-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test=
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
55v1/shard-dg2-464/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE=
#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145755v1/shard-lnl-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modese=
t-interruptible.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-=
upscaling.html">PASS</a> +4 other tests pass</li>
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
1.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@kms_flip_scaled_crc@fl=
ip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> =
+3 other tests pass</li>
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
145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sha=
rd-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS=
</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_inva=
lid_mode@bad-vtotal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_invalid=
_mode@bad-vtotal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@km=
s_plane@plane-panning-bottom-right.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#=
2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145755v1/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamp=
ing-modifiers.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_pm_ba=
cklight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.htm=
l">PASS</a></li>
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
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard=
-lnl-3/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-145755v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">PASS</a> +4 other tests pass</li>
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
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_psr=
@psr-no-drrs.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sha=
rd-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_setm=
ode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_setmode@basic.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-5/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl=
-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1=
/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_c=
reate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e87=
00dc/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a6=
7e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891368b=
75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fbf891=
368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca26fb=
f891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a93292ca=
26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26a932=
92ca26fbf891368b75a67e8700dc/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf56e26=
a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-1cf5=
6e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2752-=
1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755=
v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755=
v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755=
v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145755v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>)</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_=
async_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_atom=
ic@plane-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_atom=
ic@plane-cursor-legacy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE=
#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145755v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_=
big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_b=
ig_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-ln=
l-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1=
477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v=
1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sh=
ard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SK=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sh=
ard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191=
">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sh=
ard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512=
">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@l=
inear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/=
igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_bw@l=
inear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/=
igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl=
-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +13 other tests skip</li>
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
xe/xe-pw-145755v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tile=
d-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-ln=
l-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
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
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-=
lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel =
XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shar=
d-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +15 other tests skip</li>
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
-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/s=
hard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1=
/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdm=
i-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_curs=
or_crc@cursor-random-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms=
_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/=
igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
6 other tests skip</li>
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
55v1/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/=
shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dsc@dsc-with-b=
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
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v=
1/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@kms_flip@=
2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
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
w-145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145755v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +9 other tests ski=
p</li>
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
55v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +27 other tests skip</li>
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
145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
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
w-145755v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1457=
55v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-433/igt@k=
ms_frontbuffer_tracking@fbc-2p-rte.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
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
55v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
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
145755v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5755v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
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
pw-145755v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45755v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755=
v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_hdr@stat=
ic-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_inva=
lid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-5/igt@kms_inv=
alid_mode@clock-too-high.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_plan=
e@plane-position-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane=
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
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_=
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
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_plane_=
lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_plan=
e_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_plane_low=
res@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-433/igt@kms_pl=
ane_multiple@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4361">Intel XE#4361</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-dg2-464/igt@k=
ms_plane_multiple@tiling-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2861">Intel XE#2861</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_pm_dc@deep-pkgc=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@k=
ms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-6/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1128">Intel XE#1128</a>) +1 other test skip</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-4/igt@kms_=
psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-=
8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"=
>Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4471">Intel XE#4471</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl=
-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/sha=
rd-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">I=
ntel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-lnl-7/igt@kms_vrr@cmrr.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Int=
el XE#4459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-1/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4471">Intel XE#4471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145755v1/shard-lnl-8/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4472">Intel XE#4472</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v1/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc -&gt; xe-pw-145=
755v1</li>
</ul>
<p>IGT_8257: 8257<br />
  xe-2752-1cf56e26a93292ca26fbf891368b75a67e8700dc: 1cf56e26a93292ca26fbf89=
1368b75a67e8700dc<br />
  xe-pw-145755v1: 145755v1</p>

</body>
</html>

--===============5680443115245200525==--
