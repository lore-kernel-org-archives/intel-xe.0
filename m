Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C2CC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 18:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AEA10E1E0;
	Fri, 31 May 2024 18:19:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36C310E24E;
 Fri, 31 May 2024 18:19:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2396186230046890816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Fix_missing_runtime_o?=
 =?utf-8?q?uter_protection_for_ggtt=5Fremove=5Fnode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 18:19:45 -0000
Message-ID: <171717958591.2243224.14671239949798093232@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531160205.206604-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240531160205.206604-1-rodrigo.vivi@intel.com>
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

--===============2396186230046890816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node
URL   : https://patchwork.freedesktop.org/series/134308/
State : failure

== Summary ==

CI Bug Log - changes from xe-1390-71fb583af6dea41793b38d947a991f06156f7f11_full -> xe-pw-134308v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134308v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134308v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134308v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
    - shard-dg2-set2:     NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@hotunplug-rescan:
    - {shard-lnl}:        [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - {shard-lnl}:        [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - {shard-lnl}:        [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@xe_vm@munmap-style-unbind-many-end:
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-end.html

  
Known issues
------------

  Here are the changes found in xe-pw-134308v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1195] / [Intel XE#1451])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html
    - shard-adlp:         NOTRUN -> [INCOMPLETE][14] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#610])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1204])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][19] ([Intel XE#1204])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1874])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#324])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][24] ([Intel XE#324])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +53 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#1252])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#306]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#373]) +14 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@ctm-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201]) +14 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_color@ctm-0-25@pipe-c.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][41] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-adlp:         [PASS][42] -> [SKIP][43] ([Intel XE#1201]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@kms_cursor_crc@cursor-random-64x64.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#323])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-b:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#323])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#927])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#703])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1135] / [Intel XE#1201]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#310]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][53] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-dp4:
    - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1195])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend@b-dp4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@b-dp4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#1861]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +23 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#656]) +49 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#1331] / [Intel XE#1978]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455]) +29 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1129] / [Intel XE#1201])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1129] / [Intel XE#1201])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#836])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1122] / [Intel XE#1201])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#929]) +20 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1149] / [Intel XE#1201])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#327])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][77] ([Intel XE#1874]) +4 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#1174])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#899])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1932]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#1447])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1123] / [Intel XE#1201])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1126] / [Intel XE#1201])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1126] / [Intel XE#1201])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][93] ([Intel XE#1214]) +5 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][94] -> [DMESG-FAIL][95] ([Intel XE#482])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][97] -> [TIMEOUT][98] ([Intel XE#1473])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1473] / [Intel XE#392])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@many-rebind:
    - shard-adlp:         [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1214]) +6 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_exec_basic@many-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_basic@many-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#1392]) +11 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#288]) +31 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#358])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [PASS][109] -> [INCOMPLETE][110] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][111] -> [DMESG-WARN][112] ([Intel XE#1162])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@xe_module_load@reload.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#379])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_noexec_ping_pong.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1061] / [Intel XE#1201])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#366])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][116] -> [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#1694])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][118] ([Intel XE#1195] / [Intel XE#1694])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][119] -> [DMESG-WARN][120] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
    - shard-adlp:         [PASS][121] -> [INCOMPLETE][122] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][123] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#579])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#944])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-adlp:         [FAIL][127] ([Intel XE#1874]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         [DMESG-WARN][131] ([Intel XE#1214]) -> [PASS][132] +5 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_color@invalid-ctm-matrix-sizes.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#282] / [Intel XE#910]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][136] +6 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][137] ([Intel XE#361]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-adlp:         [SKIP][139] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [FAIL][141] ([Intel XE#1787]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_pm_rpm@i2c.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [SKIP][143] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - {shard-lnl}:        [FAIL][145] ([Intel XE#1649]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [SKIP][147] ([Intel XE#1201]) -> [PASS][148] +6 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][149] ([Intel XE#1473]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - {shard-lnl}:        [ABORT][151] ([Intel XE#1761]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr:
    - shard-adlp:         [DMESG-WARN][153] ([Intel XE#1214] / [Intel XE#358]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [FAIL][155] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         [SKIP][159] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@xe_live_ktest@xe_bo.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [INCOMPLETE][163] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [INCOMPLETE][165] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - {shard-lnl}:        [ABORT][167] ([Intel XE#1794]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1195] / [Intel XE#1349]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#801]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#316]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [SKIP][175] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1201])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][178] ([Intel XE#316])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-adlp:         [SKIP][179] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][180] ([Intel XE#1201])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][181] ([Intel XE#1231]) -> [DMESG-FAIL][182] ([Intel XE#324]) +1 other test dmesg-fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][183] ([Intel XE#1201]) -> [FAIL][184] ([Intel XE#1231])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1124]) -> [SKIP][186] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#607]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#607])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][190] ([Intel XE#1124]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#367]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][194] ([Intel XE#367]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][196] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#787]) +20 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1252]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#1252])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#787]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][206] ([Intel XE#1252])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][208] ([Intel XE#306])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#373]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][212] ([Intel XE#373]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][214] ([Intel XE#307])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][216] ([Intel XE#308])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#308]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#308])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][219] ([Intel XE#282]) -> [DMESG-WARN][220] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][222] ([Intel XE#1195] / [Intel XE#927])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][223] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][224] ([Intel XE#1195])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][226] ([Intel XE#282]) +4 other tests dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][228] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         [SKIP][229] ([Intel XE#1201]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#455])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         [SKIP][231] ([Intel XE#1201]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#307])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_display_modes@mst-extended-mode-negative.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#776]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#776])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][235] ([Intel XE#1162]) -> [INCOMPLETE][236] ([Intel XE#1195])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][238] ([Intel XE#1162]) +1 other test dmesg-warn
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][239] ([Intel XE#1162]) -> [DMESG-WARN][240] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#455]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][244] ([Intel XE#651]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#651]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][247] ([Intel XE#1201]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#656]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][249] ([Intel XE#1201]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#651])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][251] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][252] ([Intel XE#1201])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][254] ([Intel XE#653]) +14 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][255] ([Intel XE#1201]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#653]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][260] ([Intel XE#455]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#305]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][266] ([Intel XE#908])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#929]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][270] ([Intel XE#929]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1149]) -> [SKIP][272] ([Intel XE#1149] / [Intel XE#1201])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][273] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [SKIP][274] ([Intel XE#1201])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1091]) -> [SKIP][276] ([Intel XE#1091] / [Intel XE#1201])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1123]) -> [SKIP][278] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#288]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][282] ([Intel XE#288]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][284] ([Intel XE#255])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [FAIL][285] ([Intel XE#1999]) -> [SKIP][286] ([Intel XE#1192])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][288] ([Intel XE#366])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-FAIL][289] ([Intel XE#1760]) -> [DMESG-WARN][290] ([Intel XE#1760])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1573
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1787
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1978]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1978
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7875 -> IGT_7876
  * Linux: xe-1390-71fb583af6dea41793b38d947a991f06156f7f11 -> xe-pw-134308v1

  IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7876: 7876
  xe-1390-71fb583af6dea41793b38d947a991f06156f7f11: 71fb583af6dea41793b38d947a991f06156f7f11
  xe-pw-134308v1: 134308v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/index.html

--===============2396186230046890816==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix missing runtime outer protection for ggtt_remove_node</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134308/">https://patchwork.freedesktop.org/series/134308/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1390-71fb583af6dea41793b38d947a991f06156f7f11_full -&gt; xe-pw-134308v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134308v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134308v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134308v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@core_hotunplug@hotreplug.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-3/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-end:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-3/igt@xe_vm@munmap-style-unbind-many-end.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134308v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_color@ctm-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@kms_cursor_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@b-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1978">Intel XE#1978</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_exec_basic@many-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_color@invalid-ctm-matrix-sizes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_color@invalid-ctm-matrix-sizes.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1787">Intel XE#1787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761">Intel XE#1761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-shared-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-9/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349">Intel XE#1349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-463/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1390-71fb583af6dea41793b38d947a991f06156f7f11/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v1/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7875 -&gt; IGT_7876</li>
<li>Linux: xe-1390-71fb583af6dea41793b38d947a991f06156f7f11 -&gt; xe-pw-134308v1</li>
</ul>
<p>IGT_7875: 44d48b5aec41357e90aa7990c8877ca807ff8d57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7876: 7876<br />
  xe-1390-71fb583af6dea41793b38d947a991f06156f7f11: 71fb583af6dea41793b38d947a991f06156f7f11<br />
  xe-pw-134308v1: 134308v1</p>

</body>
</html>

--===============2396186230046890816==--
