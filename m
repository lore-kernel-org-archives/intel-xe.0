Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A8C83F27
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 01:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048A110E03D;
	Wed, 23 Jul 2025 01:25:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BFD10E03D;
 Wed, 23 Jul 2025 01:25:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1933355844973908799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_SR-IOV_promotions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 01:25:29 -0000
Message-ID: <175323392980.181993.7561513403662460889@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250722182618.30811-1-michal.wajdeczko@intel.com>
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

--===============1933355844973908799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: SR-IOV promotions
URL   : https://patchwork.freedesktop.org/series/151961/
State : failure

== Summary ==

CI Bug Log - changes from xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3_FULL -> xe-pw-151961v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151961v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151961v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151961v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  
#### Warnings ####

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         [SKIP][5] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-151961v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#873])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2370])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2191])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1512])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +146 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2907]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2669]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_chamelium_color@ctm-negative.html
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#306])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#373])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2390])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#307])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#307])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#308])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#309])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#5354])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4494] / [i915#3804])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4356])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4331])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4331])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4331])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2244])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1138])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1138])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1138])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2316]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2316])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#310])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#301] / [Intel XE#3149])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#301]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4543]) +15 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1397] / [Intel XE#1745])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1397])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][72] ([Intel XE#4543] / [Intel XE#4921])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +13 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#4543]) +6 other tests dmesg-fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#5390]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#651]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#651])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2312])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#658])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1469])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2352])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#656]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1158])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +12 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#616])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#616])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2763]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2763]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1122])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2893])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2893] / [Intel XE#4608])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4608]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4609]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1406]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2234])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3414]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][107] ([Intel XE#1874])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3414] / [Intel XE#3904])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vblank@wait-forked@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][109] -> [INCOMPLETE][110] ([Intel XE#4488]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@kms_vblank@wait-forked@pipe-d-dp-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_vblank@wait-forked@pipe-d-dp-4.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#4459]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1447] / [Intel XE#5596])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1447])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1123])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#5626])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-bmg:          [PASS][117] -> [FAIL][118] ([Intel XE#5420])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@xe_eu_stall@non-blocking-re-enable.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4837]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4837]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4837]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1392]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#1392]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2322]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#288]) +18 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2360]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2360] / [Intel XE#5573])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-large-malloc-mlock:
    - shard-bmg:          [PASS][131] -> [INCOMPLETE][132] ([Intel XE#5401])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@xe_exec_system_allocator@many-large-malloc-mlock.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@xe_exec_system_allocator@many-large-malloc-mlock.html

  * igt@xe_exec_system_allocator@once-mmap-file:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#4915] / [Intel XE#5560]) +10 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@xe_exec_system_allocator@once-mmap-file.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4915]) +145 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4943]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#5018])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4943]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-adlp:         [PASS][139] -> [DMESG-FAIL][140] ([Intel XE#3876])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2457])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166]) -> ([PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [SKIP][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192]) ([Intel XE#378])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-463/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-466/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-466/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-466/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-463/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-463/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#3573]) +5 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#2427])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#584])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2284] / [Intel XE#366])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2284])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#4733]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#4733])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#944]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_query@multigpu-query-topology.html
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#944])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#4130])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#4130])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#4130])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#4273])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [PASS][207] -> [DMESG-WARN][208] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_wedged@wedged-at-any-timeout.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         [SKIP][209] ([Intel XE#4947]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][211] ([Intel XE#4543]) -> [PASS][212] +3 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][213] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][215] ([Intel XE#3862]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#3862]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][219] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][221] ([Intel XE#5354]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][223] ([Intel XE#2291]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-adlp:         [SKIP][225] ([Intel XE#4950]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4208] / [i915#2575]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][229] ([Intel XE#1340]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][231] ([Intel XE#2373]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][233] ([Intel XE#5338]) -> [PASS][234] +1 other test pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][235] ([Intel XE#2316]) -> [PASS][236] +2 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#301]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#4543]) -> [PASS][240] +13 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][241] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@kms_flip@flip-vs-rmfb.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][243] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][244] +3 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [FAIL][245] -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][247] ([Intel XE#1503]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_hdr@static-swap.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_hdr@static-swap.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][249] ([Intel XE#718]) -> [PASS][250] +1 other test pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1392]) -> [PASS][252] +4 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][253] ([Intel XE#3876]) -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
    - shard-bmg:          [TIMEOUT][255] -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-adlp:         [DMESG-FAIL][257] ([Intel XE#3876]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][259] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][260] +1 other test pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_vm@munmap-style-unbind-front:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#4208]) -> [PASS][262] +5 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_vm@munmap-style-unbind-front.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_vm@munmap-style-unbind-front.html

  * igt@xe_vm@userptr-invalid:
    - shard-adlp:         [SKIP][263] ([Intel XE#4945]) -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_vm@userptr-invalid.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@xe_vm@userptr-invalid.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][265] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][266] ([Intel XE#455] / [Intel XE#787])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][268] ([Intel XE#455] / [Intel XE#787])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][270] ([Intel XE#1727] / [Intel XE#3113])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [SKIP][271] ([Intel XE#4947]) -> [DMESG-FAIL][272] ([Intel XE#4543] / [Intel XE#4921])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2312]) -> [SKIP][274] ([Intel XE#2311]) +9 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][275] ([Intel XE#5390]) -> [SKIP][276] ([Intel XE#2312]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([Intel XE#5390]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#2594]) -> [SKIP][280] ([Intel XE#2311])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][281] ([Intel XE#2311]) -> [SKIP][282] ([Intel XE#2312]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][283] ([Intel XE#2312]) -> [SKIP][284] ([Intel XE#2313]) +12 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][285] ([Intel XE#2313]) -> [SKIP][286] ([Intel XE#2312]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][287] ([Intel XE#3544]) -> [SKIP][288] ([Intel XE#3374] / [Intel XE#3544])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][289] ([Intel XE#4947]) -> [SKIP][290] ([Intel XE#1489])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#1489])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][293] ([Intel XE#2426]) -> [SKIP][294] ([Intel XE#2509])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-adlp:         [SKIP][295] ([Intel XE#4945]) -> [SKIP][296] ([Intel XE#1392] / [Intel XE#5575])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#4915]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:
    - shard-adlp:         [SKIP][299] ([Intel XE#4945]) -> [SKIP][300] ([Intel XE#4915] / [Intel XE#5560]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5401
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5573
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5596
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8472 -> IGT_8473
  * Linux: xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3 -> xe-pw-151961v1

  IGT_8472: 3f767264491a41ff3e6506f4cf7431bc72ec993a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3: 1bb52fd2f94e5c605adf88a086ab0eadcdd708e3
  xe-pw-151961v1: 151961v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/index.html

--===============1933355844973908799==
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
<tr><td><b>Series:</b></td><td>SR-IOV promotions</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151961/">https://patchwork.freedesktop.org/series/151961/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151961v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151961v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3458-1bb52fd2f94e5c605adf88a086ab0eadc=
dd708e3_FULL -&gt; xe-pw-151961v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151961v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151961v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1519=
61v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec=
_threads@threads-cm-fd-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe=
_exec_threads@threads-cm-fd-userptr-invalidate.html">FAIL</a> +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-=
bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.ht=
ml">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s2idle-d3cold-basic-exec:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_pm@s=
2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-=
1/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151961v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi=
-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-e=
nable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-en=
able-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sh=
ard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +15 other tes=
ts dmesg-warn</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4921">Intel XE#4921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-ad=
lp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@kms_pl=
ane_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_plane_cursor@viewpo=
rt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_plane_cursor@viewport@p=
ipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip=
</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@kms_psr@fbc-psr2-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@kms_psr@fbc-psr2-basic@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@kms_rotation_crc@multiplane-=
rotation-cropping-top.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@kms_vb=
lank@wait-forked@pipe-d-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@kms_vblank@wai=
t-forked@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5596">Intel XE#5596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-3/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-2/igt@xe_eu_st=
all@non-blocking-re-enable.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_eu_stall@non-bl=
ocking-re-enable.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5420">Intel XE#5420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-5/igt@xe_eudebug_online@debugger-re=
open.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_bas=
ic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5573">Intel XE#5573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-1/igt@xe_exec_=
system_allocator@many-large-malloc-mlock.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@xe_e=
xec_system_allocator@many-large-malloc-mlock.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5401">Intel XE#5401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@xe_exec_system_allocator@onc=
e-mmap-file.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro=
-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +145 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1519=
61v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-huge-nomemset:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec=
_threads@threads-hang-userptr-rebind.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-1/igt@xe_exec=
_threads@threads-hang-userptr-rebind.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcd=
d708e3/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab=
0eadcdd708e3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf8=
8a086ab0eadcdd708e3/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c6=
05adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f=
94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb=
52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-34=
58-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd7=
08e3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a086ab0e=
adcdd708e3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605adf88a0=
86ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e5c605a=
df88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52fd2f94e=
5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-1bb52f=
d2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3458-=
1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151961v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51961v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151961v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151961v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151961v1/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-6/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@=
selfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151961v1/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_wedg=
ed@wedged-at-any-timeout.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@xe_wedged@wedged-at=
-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other test=
s dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shar=
d-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151961v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151961v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard=
-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel =
XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151961v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-cc=
s@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/s=
hard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_cur=
sor_legacy@short-flip-after-cursor-toggle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard=
-adlp-3/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html">PASS</a>=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_cu=
rsor_legacy@short-flip-after-cursor-toggle.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151961v1/shard-dg2-436/igt@kms_cursor_legacy@short-flip-after-cursor-toggl=
e.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-5/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-1/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/s=
hard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-3/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_f=
lip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51961v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3=
/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-8/igt@kms_flip_s=
caled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-3/igt@km=
s_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-lnl-8/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151961v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v=
1/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.=
html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-464/igt@xe_exe=
c_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-463/=
igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@xe_exec_=
system_allocator@many-execqueues-malloc-mlock-nomemset.html">TIMEOUT</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sha=
rd-bmg-6/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-2/igt@xe_exec=
_threads@threads-bal-mixed-fd-userptr.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sha=
rd-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-1/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp=
-6/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_vm@=
munmap-style-unbind-front.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-dg2-436/igt@xe_=
vm@munmap-style-unbind-front.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@userptr-invalid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_vm@u=
serptr-invalid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-2/igt@xe_vm@userptr-i=
nvalid.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947"=
>Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151961v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151961v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151961v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151961v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151961v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1519=
61v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v=
1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594"=
>Intel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151961v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-prim=
scrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51961v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
961v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@kms_psr=
2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1519=
61v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-excee=
d-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1519=
61v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec=
_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151961v1/shard-adlp-9/i=
gt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE=
#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-dg2-433/igt@xe_exe=
c_system_allocator@many-execqueues-mmap-remap-eocheck.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1961v1/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-rema=
p-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4915">Intel XE#4915</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3/shard-adlp-3/igt@xe_exec=
_system_allocator@many-large-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Inte=
l XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151961v1/shard-adlp-4/igt@xe_exec_system_allocator@many-large-mmap-rem=
ap-ro-dontunmap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +3 other=
 tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8472 -&gt; IGT_8473</li>
<li>Linux: xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3 -&gt; xe-pw-151=
961v1</li>
</ul>
<p>IGT_8472: 3f767264491a41ff3e6506f4cf7431bc72ec993a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3: 1bb52fd2f94e5c605adf88a=
086ab0eadcdd708e3<br />
  xe-pw-151961v1: 151961v1</p>

</body>
</html>

--===============1933355844973908799==--
