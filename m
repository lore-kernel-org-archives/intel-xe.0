Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5EAC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 19:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D68110E488;
	Thu,  7 Aug 2025 19:05:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA1810E13E;
 Thu,  7 Aug 2025 19:05:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3304754917691137692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_MADVISE_SQUASH_f?=
 =?utf-8?q?or_CI-v6=5Fwith=5Fcomments=5Faddressed=5Fgpuvm=5Fchanges?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 19:05:54 -0000
Message-ID: <175459355449.220821.4534111675173768112@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807154107.1692656-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807154107.1692656-1-himal.prasad.ghimiray@intel.com>
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

--===============3304754917691137692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: MADVISE SQUASH for CI-v6_with_comments_addressed_gpuvm_changes
URL   : https://patchwork.freedesktop.org/series/152638/
State : failure

== Summary ==

CI Bug Log - changes from xe-3514-922b0dea064e07d9d19f9241723debd67572b611_FULL -> xe-pw-152638v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152638v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152638v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152638v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-152638v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#4208])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@fbdev@unaligned-read.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@fbdev@unaligned-read.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3908]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3862]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +195 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#1727] / [Intel XE#3113])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1188])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2291])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#5354])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4494] / [i915#3804])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2244])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2375])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#3098]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#310])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#4543]) +6 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-4/igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:
    - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#3098]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-9/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#301])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#4543] / [Intel XE#5208])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][56] -> [FAIL][57] ([Intel XE#1874])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][58] -> [DMESG-FAIL][59] ([Intel XE#4543]) +1 other test dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#4173])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#656])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#5390]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#658])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#651]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#651]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#653]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2312]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#653]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#1503])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#4208] / [i915#2575]) +63 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_lease@lease-invalid-crtc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2763]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-73:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#3428] / [Intel XE#5215])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms@plane-73.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-73.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1489])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1489]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1489])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1122] / [Intel XE#5580])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1435])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#4227]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_vrr@flipline.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4837]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#4208]) +133 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2322]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1392] / [Intel XE#5575])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#1392]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#288] / [Intel XE#5561])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#288]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4837]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4915]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#4915]) +36 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4943]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_oa@polling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3573])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_oa@polling.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#1173])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4733])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4733])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4273])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][107] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-random-128x128:
    - shard-bmg:          [SKIP][111] ([Intel XE#2320]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_cursor_crc@cursor-random-128x128.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-128x128.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#4208] / [i915#2575]) -> [PASS][114] +71 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][115] ([Intel XE#2291]) -> [PASS][116] +6 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][117] ([Intel XE#4294]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][119] ([Intel XE#2316]) -> [PASS][120] +7 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][121] ([Intel XE#301]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][123] ([Intel XE#4543]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-6/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][125] ([Intel XE#4543]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][127] ([Intel XE#1874]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][130] +6 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][131] ([Intel XE#3012]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][133] ([Intel XE#4596]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr:
    - shard-bmg:          [FAIL][135] -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#4208]) -> [PASS][138] +136 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1392]) -> [PASS][140] +5 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - shard-bmg:          [TIMEOUT][141] -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-basic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [ABORT][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap-eocheck.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-bmg:          [DMESG-FAIL][145] ([Intel XE#3876]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][147] ([Intel XE#4208]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_module_load@reload.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_module_load@reload.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][150] +2 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@xe_pm@s2idle-basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-6/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-FAIL][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#623]) -> [SKIP][154] ([Intel XE#4208] / [i915#2575])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#4543]) -> [DMESG-WARN][156] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#3768]) -> [SKIP][158] ([Intel XE#4208] / [i915#2575])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#316]) -> [SKIP][160] ([Intel XE#4208]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#4208]) -> [SKIP][162] ([Intel XE#316]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1124]) -> [SKIP][164] ([Intel XE#4208]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][166] ([Intel XE#1124]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#4208]) -> [SKIP][168] ([Intel XE#1124]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1124]) -> [SKIP][170] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#619]) -> [SKIP][172] ([Intel XE#2351] / [Intel XE#4208])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208]) -> [SKIP][174] ([Intel XE#610])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208] / [i915#2575]) -> [SKIP][176] ([Intel XE#2191])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#2191]) -> [SKIP][178] ([Intel XE#4208] / [i915#2575])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#367]) -> [SKIP][180] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208] / [i915#2575]) -> [SKIP][182] ([Intel XE#367])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][184] ([Intel XE#455] / [Intel XE#787])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#4208]) -> [SKIP][186] ([Intel XE#2907])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][188] ([Intel XE#4208]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][190] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208]) -> [SKIP][194] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4418]) -> [SKIP][196] ([Intel XE#2351] / [Intel XE#4208])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [SKIP][198] ([Intel XE#373]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#306]) -> [SKIP][200] ([Intel XE#4208] / [i915#2575])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#373]) -> [SKIP][202] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][203] ([Intel XE#1178]) -> [SKIP][204] ([Intel XE#2341]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_content_protection@atomic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][205] ([Intel XE#2341]) -> [FAIL][206] ([Intel XE#1178])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#307]) -> [SKIP][208] ([Intel XE#4208] / [i915#2575])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4208] / [i915#2575]) -> [SKIP][210] ([Intel XE#307])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#455]) -> [SKIP][212] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_content_protection@lic-type-1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][213] ([Intel XE#2341]) -> [FAIL][214] ([Intel XE#1188])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_content_protection@uevent.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#308]) -> [SKIP][216] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#4422]) -> [SKIP][218] ([Intel XE#4208])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#776]) -> [SKIP][220] ([Intel XE#4208])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208] / [i915#2575]) -> [SKIP][222] ([Intel XE#1137])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1135]) -> [SKIP][224] ([Intel XE#4208] / [i915#2575])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_feature_discovery@psr2.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][225] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][226] ([Intel XE#301])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [DMESG-FAIL][227] ([Intel XE#4543]) -> [DMESG-WARN][228] ([Intel XE#4543]) +1 other test dmesg-warn
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#455]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#455]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455]) -> [SKIP][234] ([Intel XE#4208])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208]) -> [SKIP][236] ([Intel XE#651]) +17 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][237] ([Intel XE#2311]) -> [SKIP][238] ([Intel XE#2312]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2312]) -> [SKIP][240] ([Intel XE#2311]) +23 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][241] ([Intel XE#2312]) -> [SKIP][242] ([Intel XE#5390]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][243] ([Intel XE#5390]) -> [SKIP][244] ([Intel XE#2312]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#651]) -> [SKIP][246] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][248] ([Intel XE#651]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#651]) -> [SKIP][250] ([Intel XE#4208]) +15 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208]) -> [SKIP][252] ([Intel XE#653]) +14 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#653]) -> [SKIP][254] ([Intel XE#4208]) +14 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][255] ([Intel XE#2313]) -> [SKIP][256] ([Intel XE#2312]) +8 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1158]) -> [SKIP][258] ([Intel XE#4208])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][260] ([Intel XE#653]) +6 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#653]) -> [SKIP][262] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][263] ([Intel XE#2312]) -> [SKIP][264] ([Intel XE#2313]) +18 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2925]) -> [SKIP][266] ([Intel XE#4208])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#4208]) -> [SKIP][268] ([Intel XE#2927])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208]) -> [SKIP][270] ([Intel XE#2925])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#4359])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][273] ([Intel XE#4596]) -> [SKIP][274] ([Intel XE#5021])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#5021]) -> [SKIP][276] ([Intel XE#4208] / [i915#2575])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-yf.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#870]) -> [SKIP][278] ([Intel XE#4208]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1489]) -> [SKIP][280] ([Intel XE#4208]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [SKIP][282] ([Intel XE#1489]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][284] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][288] ([Intel XE#4208]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][290] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_psr@psr-sprite-blt.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#2939])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208] / [i915#2575]) -> [SKIP][294] ([Intel XE#3414])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1127]) -> [SKIP][296] ([Intel XE#4208] / [i915#2575])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#3414]) -> [SKIP][298] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][299] ([Intel XE#1729]) -> [SKIP][300] ([Intel XE#4208] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208] / [i915#2575]) -> [SKIP][302] ([Intel XE#455]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_vrr@flip-dpms.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2168]) -> [SKIP][304] ([Intel XE#4208] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_vrr@lobf.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][306] ([Intel XE#4208])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4208]) -> [SKIP][308] ([Intel XE#1123])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#5626]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_eu_stall@invalid-sampling-rate.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4837]) -> [SKIP][312] ([Intel XE#4208]) +8 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208]) -> [SKIP][314] ([Intel XE#4837]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4518]) -> [SKIP][316] ([Intel XE#4208])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#288]) +17 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exec_fault_mode@many-basic-prefetch.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#288]) -> [SKIP][320] ([Intel XE#4208]) +18 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#4915]) +187 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4915]) -> [SKIP][324] ([Intel XE#4208]) +176 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208]) -> [SKIP][326] ([Intel XE#560])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#3573]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#3573]) -> [SKIP][330] ([Intel XE#4208]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#2838] / [Intel XE#979])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1061]) -> [FAIL][334] ([Intel XE#1173])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-432/igt@xe_peer2peer@read.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208]) -> [SKIP][336] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][338] ([Intel XE#4208])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#579])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#4650]) -> [SKIP][342] ([Intel XE#4208])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@xe_pmu@all-fn-engine-activity-load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [ABORT][343] ([Intel XE#3970]) -> [DMESG-WARN][344] ([Intel XE#3876])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4733]) -> [SKIP][346] ([Intel XE#4208]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#4733]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#944]) -> [SKIP][350] ([Intel XE#4208]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#4208]) -> [SKIP][352] ([Intel XE#944]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4814]) -> [SKIP][354] ([Intel XE#4208])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4208]) -> [SKIP][356] ([Intel XE#4814])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_render_copy@render-stress-2-copies.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [SKIP][358] ([Intel XE#4130])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4208]) -> [SKIP][360] ([Intel XE#4273])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sriov_flr@flr-twice.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208]) -> [SKIP][362] ([Intel XE#3342])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5215
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3514-922b0dea064e07d9d19f9241723debd67572b611 -> xe-pw-152638v1

  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3514-922b0dea064e07d9d19f9241723debd67572b611: 922b0dea064e07d9d19f9241723debd67572b611
  xe-pw-152638v1: 152638v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/index.html

--===============3304754917691137692==
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
<tr><td><b>Series:</b></td><td>drm/xe: MADVISE SQUASH for CI-v6_with_commen=
ts_addressed_gpuvm_changes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152638/">https://patchwork.freedesktop.org/series/152638/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152638v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152638v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3514-922b0dea064e07d9d19f9241723debd67=
572b611_FULL -&gt; xe-pw-152638v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152638v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152638v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1526=
38v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_pm_r=
pm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_pm_rpm@universal=
-planes-dpms.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152638v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@fbdev@=
unaligned-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@fbdev@unaligned-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
4">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_atom=
ic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-hdmi-a-3.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152638v1/shard-bmg-4/igt@kms_atomic_transition@plane-use-after-nonblocki=
ng-unbind-fencing@pipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-5=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-st=
ress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-=
single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-5/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/s=
hard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-dp2-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-modeset@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-8/igt@kms_flip@b=
asic-flip-vs-modeset@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_fli=
p@dpms-vs-vblank-race@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-9/igt@kms_flip@dpm=
s-vs-vblank-race@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-lnl-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152638v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard=
-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#=
4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_le=
ase@lease-invalid-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_lease@lease-inva=
lid-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +63 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-73:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@kms_pm_r=
pm@universal-planes-dpms@plane-73.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-4/igt@kms_pm_rpm@=
universal-planes-dpms@plane-73.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5215">Intel XE#5215=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other test=
s skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@kms_psr@fbc-pr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_vrr@=
flipline.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152638v1/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_exe=
c_balancer@no-exec-cm-parallel-userptr-rebind.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE=
#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpo=
int-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-busy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-adlp-2/igt@xe_exec_system_allocator@pro=
cess-many-large-execqueues-new-busy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-multi-=
fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-malloc-multi-fault.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel =
XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_oa@polling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Int=
el XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_pxp@pxp-src-to-pxp-dest-re=
ndercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152638v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-432/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_curs=
or_crc@cursor-random-128x128.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@km=
s_cursor_crc@cursor-random-128x128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sha=
rd-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> +71 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152638v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-7/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +7 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shar=
d-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_fli=
p@flip-vs-modeset-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard=
-adlp-6/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152638v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-userptr.html">FAIL</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@x=
e_exec_balancer@many-execqueues-cm-virtual-userptr.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +136 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_=
fault_mode@many-execqueues-basic.html">TIMEOUT</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_exec_f=
ault_mode@many-execqueues-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap=
-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-stride-mmap-remap-ro-dontunmap-eocheck.html">=
ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152638v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mmap-=
remap-ro-dontunmap-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_exec_=
threads@threads-fd-userptr-invalidate-race.html">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v=
1/shard-bmg-1/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_mod=
ule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_module_loa=
d@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@xe_pm@s=
2idle-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-adlp-6/i=
gt@xe_pm@s2idle-basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@xe_pm@s3=
-multiple-execs.html">DMESG-FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/igt@xe_pm@s3-multiple-execs=
.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-=
436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel =
XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-4=
36/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@km=
s_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt=
@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard=
-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-152638v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt=
@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466=
/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152638v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/=
shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-43=
6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_bw=
@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
638v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-4=
34/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152638v1/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shar=
d-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2=
-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-=
434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-=
434/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_chame=
lium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ch=
amelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-2/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sh=
ard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms=
_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_fbcon_f=
bt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-=
434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-adlp-1/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152638v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1526=
38v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152638v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52638v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sh=
ard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
638v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152638v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-d=
g2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sha=
rd-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_pi=
pe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/=
igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_p=
m_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/s=
hard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-4=
34/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ps=
r@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-d=
g2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms=
_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ps=
r@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/=
igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/s=
hard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
39">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_ro=
tation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/sh=
ard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-d=
g2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-d=
g2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@kms=
_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@kms_vrr@lobf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_com=
pute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
638v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_eu_=
stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@x=
e_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_eud=
ebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_=
eudebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_eud=
ebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg=
2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exe=
c_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/=
igt@xe_exec_fault_mode@many-basic-prefetch.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436=
/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +187 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4=
915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52638v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-l=
arge-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +176 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-43=
6/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_pat@pat-i=
ndex-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-435/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-bmg-1/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_pxp=
@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-d=
g2-436/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-=
dg2-434/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel =
XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-466/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/igt@xe_=
query@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-4=
66/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-434/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-436/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_ren=
der_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/=
igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-=
434/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sri=
ov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-466/igt@xe_sriov_flr=
@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3514-922b0dea064e07d9d19f9241723debd67572b611/shard-dg2-436/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152638v1/shard-dg2-434/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3514-922b0dea064e07d9d19f9241723debd67572b611 -&gt; xe-pw-152=
638v1</li>
</ul>
<p>IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3514-922b0dea064e07d9d19f9241723debd67572b611: 922b0dea064e07d9d19f924=
1723debd67572b611<br />
  xe-pw-152638v1: 152638v1</p>

</body>
</html>

--===============3304754917691137692==--
