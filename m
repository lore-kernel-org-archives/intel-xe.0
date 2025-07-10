Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBDEC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85810E940;
	Thu, 10 Jul 2025 18:06:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6B510E940;
 Thu, 10 Jul 2025 18:06:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8367574077463891528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/migrate=3A_fix_copy?=
 =?utf-8?q?_direction_in_access=5Fmemory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 18:06:38 -0000
Message-ID: <175217079836.151663.9995313265746588265@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710134128.800756-2-matthew.auld@intel.com>
In-Reply-To: <20250710134128.800756-2-matthew.auld@intel.com>
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

--===============8367574077463891528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: fix copy direction in access_memory
URL   : https://patchwork.freedesktop.org/series/151444/
State : failure

== Summary ==

CI Bug Log - changes from xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f_FULL -> xe-pw-151444v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-151444v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151444v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151444v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][1] ([Intel XE#2291]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-151444v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#3157])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][4] -> [FAIL][5] ([Intel XE#3908]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#4543]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][9] ([Intel XE#4543])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#2191]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#2907])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +111 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#3862]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#3862])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#787]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#306])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#306])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#373]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#373]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         [PASS][31] -> [SKIP][32] ([Intel XE#4950]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_color@invalid-ctm-matrix-sizes.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#3304])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1188])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#308]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#4302])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4494])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#4354])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4356])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1135])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#310]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-adlp:         [PASS][54] -> [SKIP][55] ([Intel XE#4947])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#656]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2311])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#651]) +12 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#653]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#653]) +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#1503])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2925])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#3012])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_plane_cursor@viewport.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#4596])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#5021])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2571])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#309]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][76] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#3309])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1489])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1489]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1122])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#2883]) +2 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1435])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1500])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#4488]) +1 other test incomplete
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#455] / [Intel XE#488])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1126])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#5419])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#4518])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#688])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#1392]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1392])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#288]) +11 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_fault_mode@many-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#288]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_fault_mode@many-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#4837]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#4837]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4915]) +61 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#4915]) +107 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#4937] / [Intel XE#5018])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4501])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_oa@buffer-size.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#2541] / [Intel XE#3573])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1337])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2284] / [Intel XE#366])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-most-load-idle:
    - shard-adlp:         [PASS][113] -> [SKIP][114] ([Intel XE#4945]) +19 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_pmu@engine-activity-most-load-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pmu@engine-activity-most-load-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4733])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4733])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#944])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][119] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][121] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][123] ([Intel XE#3124]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][125] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][127] ([Intel XE#2291]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][129] ([Intel XE#4294]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][131] ([Intel XE#2316]) -> [PASS][132] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][133] ([Intel XE#4543]) -> [PASS][134] +9 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][135] ([Intel XE#1874]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][137] ([Intel XE#4543]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][139] ([Intel XE#1503]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][141] ([Intel XE#3012]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][143] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][144] +4 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][145] ([Intel XE#4596]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][147] ([Intel XE#1435]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1392]) -> [PASS][150] +3 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][151] ([Intel XE#5018]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         [SKIP][153] ([Intel XE#610]) -> [SKIP][154] ([Intel XE#4947])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][155] ([Intel XE#316]) -> [SKIP][156] ([Intel XE#4947])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][157] ([Intel XE#1124]) -> [SKIP][158] ([Intel XE#2351] / [Intel XE#4947])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][159] ([Intel XE#367]) -> [SKIP][160] ([Intel XE#4950])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][161] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][162] ([Intel XE#4947])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         [SKIP][163] ([Intel XE#3442]) -> [SKIP][164] ([Intel XE#4947])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][165] ([Intel XE#306]) -> [SKIP][166] ([Intel XE#4950])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_chamelium_color@ctm-0-50.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][167] ([Intel XE#2341]) -> [FAIL][168] ([Intel XE#1178]) +2 other tests fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_content_protection@atomic.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][169] ([Intel XE#1178]) -> [SKIP][170] ([Intel XE#2341]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_content_protection@legacy.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         [SKIP][171] ([Intel XE#308]) -> [SKIP][172] ([Intel XE#4950])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][173] ([Intel XE#309]) -> [SKIP][174] ([Intel XE#4950])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][175] ([Intel XE#323]) -> [SKIP][176] ([Intel XE#4950])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-adlp:         [SKIP][177] ([Intel XE#310]) -> [SKIP][178] ([Intel XE#4950])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_flip@2x-nonexisting-fb.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#4543]) -> [DMESG-WARN][180] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][181] ([Intel XE#1874]) -> [DMESG-FAIL][182] ([Intel XE#4543])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2311]) +19 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#4947]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#2312]) -> [SKIP][188] ([Intel XE#5390]) +14 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][189] ([Intel XE#5390]) -> [SKIP][190] ([Intel XE#2312]) +8 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][191] ([Intel XE#2311]) -> [SKIP][192] ([Intel XE#2312]) +20 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][193] ([Intel XE#656]) -> [SKIP][194] ([Intel XE#4947])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][195] ([Intel XE#656]) -> [SKIP][196] ([Intel XE#2351] / [Intel XE#4947])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][197] ([Intel XE#2312]) -> [SKIP][198] ([Intel XE#2313]) +21 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][199] ([Intel XE#2313]) -> [SKIP][200] ([Intel XE#2312]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         [SKIP][201] ([Intel XE#653]) -> [SKIP][202] ([Intel XE#4947]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][203] ([Intel XE#5021]) -> [SKIP][204] ([Intel XE#4596]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         [SKIP][205] ([Intel XE#1489]) -> [SKIP][206] ([Intel XE#4947])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#362]) -> [FAIL][208] ([Intel XE#1729])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-adlp:         [SKIP][209] ([Intel XE#4837]) -> [SKIP][210] ([Intel XE#4945]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_eudebug@basic-vm-access-userptr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         [SKIP][211] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][212] ([Intel XE#4945])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_evict@evict-beng-small.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][213] ([Intel XE#288]) -> [SKIP][214] ([Intel XE#4945])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_system_allocator@many-stride-mmap-new-huge:
    - shard-adlp:         [SKIP][215] ([Intel XE#4915]) -> [SKIP][216] ([Intel XE#4945]) +24 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [DMESG-WARN][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [SKIP][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173]) -> ([PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [SKIP][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268]) ([Intel XE#378])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@xe_module_load@load.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f -> xe-pw-151444v1

  IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f: ab7865510db0144b2f262ded130f8cc54026d64f
  xe-pw-151444v1: 151444v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/index.html

--===============8367574077463891528==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: fix copy direction in access=
_memory</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151444/">https://patchwork.freedesktop.org/series/151444/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151444v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151444v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3387-ab7865510db0144b2f262ded130f8cc54=
026d64f_FULL -&gt; xe-pw-151444v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-151444v1_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151444v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1514=
44v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:=
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151444v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151444v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-a=
dlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg=
2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-=
yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
24">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-cr=
c-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_col=
or@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_color@invali=
d-ctm-matrix-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-433/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-436/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_crc@cursor-slidin=
g-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +13 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-=
adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151444v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_pla=
ne_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_plane_cursor@viewport=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_plane_multiple@2x-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_plane_scaling@2x-scaler-=
multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_plane_scaling@plane-upsc=
ale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_psr2_sf@pr-cursor-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plan=
e-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6/igt@kms_set=
mode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel=
 XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-5/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-466/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_vblank@ts-=
continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/sha=
rd-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-b=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-ex=
ec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_fault_mode@many-rebi=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_exec_sip_eudebug@breakpo=
int-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoi=
nt-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_exec_system_allocator@onc=
e-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +61 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_exec_system_allocator@th=
reads-many-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +107 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-lnl-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4937">Intel XE#4937</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_oa@buffer-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501"=
>Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-466/igt@xe_oa@create-destroy-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pat@display-vs-wb-transie=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-most-load-idle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_pmu@=
engine-activity-most-load-idle.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pmu@engine=
-activity-most-load-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +19 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_query@multigpu-query-engi=
nes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@xe_query@multigpu-query-pxp=
-status.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151444v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-435/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151444v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-1/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-8/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +9 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151444v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel X=
E#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151444v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.ht=
ml">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-3/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-=
dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151444v1/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big=
_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@=
kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big=
_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_=
big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_big=
_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@k=
ms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_bw@=
linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_ccs=
@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444=
v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_ccs=
@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp=
-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_chamel=
ium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-2/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cur=
sor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/i=
gt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151444v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fli=
p@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@kms_flip@2x-=
nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-4/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp=
-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51444v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151444v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15144=
4v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151444v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1444v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-=
1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@kms_psr=
2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/sh=
ard-adlp-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-dg2-436/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_eude=
bug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe=
_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_evic=
t@evict-beng-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@x=
e_evict@evict-beng-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444=
v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-new-huge:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_exec=
_system_allocator@many-stride-mmap-new-huge.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/sha=
rd-adlp-1/igt@xe_exec_system_allocator@many-stride-mmap-new-huge.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64=
f/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc540=
26d64f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8=
cc54026d64f/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded=
130f8cc54026d64f/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f2=
62ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab786551=
0db0144b2f262ded130f8cc54026d64f/shard-adlp-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7=
865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-338=
7-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-3/igt@=
xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/shard-a=
dlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54026d6=
4f/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f8cc54=
026d64f/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262ded130f=
8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b2f262=
ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db0144b=
2f262ded130f8cc54026d64f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865510db=
0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3387-ab7865=
510db0144b2f262ded130f8cc54026d64f/shard-adlp-9/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-151444v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard=
-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/=
shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1514=
44v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151444v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-a=
dlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151444v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151444v1/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/sh=
ard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151444v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151444v1/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151444=
v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f -&gt; xe-pw-151=
444v1</li>
</ul>
<p>IGT_8450: 00fdb3b725bed1e26f3cf6907d5f74824f443819 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3387-ab7865510db0144b2f262ded130f8cc54026d64f: ab7865510db0144b2f262de=
d130f8cc54026d64f<br />
  xe-pw-151444v1: 151444v1</p>

</body>
</html>

--===============8367574077463891528==--
