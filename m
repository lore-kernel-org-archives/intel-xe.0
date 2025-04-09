Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0493AC369A2
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 11:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A227410E857;
	Wed,  9 Apr 2025 11:28:37 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743310E0C2;
 Wed,  9 Apr 2025 11:28:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5213642564847804317=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Disble_invalidat?=
 =?utf-8?q?e_in_migration_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 11:28:37 -0000
Message-ID: <174419811714.51881.7186864190291075228@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409091210.1590853-1-dev@lankhorst.se>
In-Reply-To: <20250409091210.1590853-1-dev@lankhorst.se>
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

--===============5213642564847804317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disble invalidate in migration job
URL   : https://patchwork.freedesktop.org/series/147452/
State : failure

== Summary ==

CI Bug Log - changes from xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b_FULL -> xe-pw-147452v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147452v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147452v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147452v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +3 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-lnl:          NOTRUN -> [ABORT][3] +2 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-bmg:          [PASS][4] -> [ABORT][5] +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - shard-bmg:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format@pipe-b-plane-5:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-5.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-5.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-dg2-set2:     [PASS][13] -> [ABORT][14] +18 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  
Known issues
------------

  Here are the changes found in xe-pw-147452v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-adlp:         [PASS][16] -> [ABORT][17] ([Intel XE#3970]) +8 other tests abort
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#316]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#4543]) +3 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#610])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2191]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +76 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#3442])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#3442])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3432]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2887]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#787]) +35 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3113])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#373]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2325]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2252]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#373]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#455]) +16 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2390])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#307])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2341])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2320]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2286])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2291])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2291]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#309]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#309])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#309])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1340])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#3009])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_dp_aux_dev.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4354])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4354]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#4356])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#4294])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#4331])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2244])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#4422])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4422]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4156])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2373])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1421])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#310])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][82] -> [FAIL][83] ([Intel XE#301])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [FAIL][85] ([Intel XE#3321])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#310])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2316])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#310]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2293]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][94] -> [DMESG-FAIL][95] ([Intel XE#4543])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#651]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#656]) +32 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2312]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#656]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2311]) +25 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#656]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4141]) +15 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2352])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#651])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2313]) +24 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#653]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2502])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#3012])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4298])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#4298])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#346])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2486])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2393])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2493])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][119] ([Intel XE#4212])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2763]) +8 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2763]) +24 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2938])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2391])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#908])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][126] ([Intel XE#718])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#836])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1489]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1489]) +9 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2414]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1127])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2330])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#455])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2450])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1499])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2168]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1123])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2504])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#4497]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2905]) +10 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2905]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2905] / [Intel XE#3889])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#4577])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2905]) +9 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4518])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#688])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1392]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1392]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2322]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][156] -> [SKIP][157] ([Intel XE#1392]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288]) +21 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#288]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - shard-adlp:         NOTRUN -> [ABORT][160] ([Intel XE#3970]) +3 other tests abort
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#2229])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2236])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2284])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][166] -> [ABORT][167] ([Intel XE#1794]) +1 other test abort
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-8/igt@xe_pm@s4-basic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#579])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#4650])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#4733]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#4733]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#944]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#4273])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#4351])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][176] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][178] ([Intel XE#2291]) -> [PASS][179] +2 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][180] ([Intel XE#1475]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][182] ([Intel XE#4667]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#455]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][186] ([Intel XE#2316]) -> [PASS][187] +3 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#310]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [FAIL][190] ([Intel XE#2882]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][192] ([Intel XE#3321]) -> [PASS][193] +6 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][194] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][196] ([Intel XE#4543]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#656]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][200] ([Intel XE#2883]) -> [PASS][201] +2 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_setmode@basic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_setmode@basic.html
    - shard-lnl:          [FAIL][202] ([Intel XE#2883]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-6/igt@kms_setmode@basic.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][204] ([Intel XE#771]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1392]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - shard-adlp:         [DMESG-WARN][208] ([Intel XE#4173]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-9/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [DMESG-WARN][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229]) ([Intel XE#4173]) -> ([PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-9/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-9/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-1/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@xe_module_load@load.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][252] ([Intel XE#1794]) -> [PASS][253] +1 other test pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-adlp:         [DMESG-WARN][254] ([Intel XE#4543]) -> [ABORT][255] ([Intel XE#3970])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][256] ([Intel XE#4543]) -> [ABORT][257] ([Intel XE#3970]) +4 other tests abort
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][259] ([Intel XE#787]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#787]) -> [SKIP][261] ([Intel XE#455] / [Intel XE#787])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][262] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][263] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][264] ([Intel XE#1178]) -> [SKIP][265] ([Intel XE#455])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [SKIP][266] ([Intel XE#2341]) -> [FAIL][267] ([Intel XE#1178])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#455] / [i915#3804]) -> [SKIP][269] ([i915#3804])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][270] ([Intel XE#2049]) -> [SKIP][271] ([Intel XE#310])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][272] ([Intel XE#2312]) -> [SKIP][273] ([Intel XE#2311]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#656]) -> [SKIP][275] ([Intel XE#651]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][276] ([Intel XE#2311]) -> [SKIP][277] ([Intel XE#2312]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][278] ([Intel XE#4141]) -> [SKIP][279] ([Intel XE#2312]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][280] ([Intel XE#2312]) -> [SKIP][281] ([Intel XE#4141]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#651]) -> [SKIP][283] ([Intel XE#656]) +5 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#656]) -> [SKIP][285] ([Intel XE#653]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][286] ([Intel XE#2312]) -> [SKIP][287] ([Intel XE#2313]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#2312]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#656]) +7 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][292] ([Intel XE#1035]) -> [ABORT][293] ([Intel XE#3970])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         [WARN][294] ([Intel XE#2078]) -> [ABORT][295] ([Intel XE#3970])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b -> xe-pw-147452v1

  IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b: b920ef1b99d9f1e98fe7831037bc28054f903c7b
  xe-pw-147452v1: 147452v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/index.html

--===============5213642564847804317==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disble invalidate in migration job</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147452/">https://patchwork.freedesktop.org/series/147452/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147452v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147452v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2922-b920ef1b99d9f1e98fe7831037bc28054=
f903c7b_FULL -&gt; xe-pw-147452v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147452v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147452v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1474=
52v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-3/igt@kms=
_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">ABORT</a> +3 other tes=
ts abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-4.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plan=
e@pixel-format@pipe-b-plane-0.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel=
-format@pipe-b-plane-0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plan=
e@pixel-format@pipe-b-plane-3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel=
-format@pipe-b-plane-3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_plan=
e@pixel-format@pipe-b-plane-5.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane@pixel=
-format@pipe-b-plane-5.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@xe_compu=
te_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
452v1/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe=
_engine_class_compute.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@xe_evi=
ct_ccs@evict-overcommit-parallel-nofree-reopen.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/=
igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">ABORT</a> +1=
8 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147452v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@kms_big=
_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_big_fb@linear=
-8bpp-rotate-180.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_chamelium_audio@hdmi-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_chamelium_color@ctm-gree=
n-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-c=
rc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_content_protection@atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/sh=
ard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_dp=
_aux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#=
3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-466/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@2x-fl=
ip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_fli=
p@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-ts-ch=
eck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-1/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-3/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp=
-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +32 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_joiner@basic-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +24 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-1/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@kms_scaling_modes@scaling-m=
ode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_eu_stall@invalid-sampling=
-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-me=
tadata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_evict@evict-small-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@xe_exec_basic@=
multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_exec_threads@threads-hang=
-shared-vm-userptr-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +3 other tests abor=
t</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@xe_live_ktest@xe_bo@xe_bo_evi=
ct_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_oa@syncs-syncobj-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_oa@unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-8/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-147452v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#179=
4</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-loa=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_query@multigpu-query-confi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-bmg-6/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147452v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/sha=
rd-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_=
dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/s=
hard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_flip@=
2x-flip-vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-7/igt@kms_flip=
@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-4/igt@kms_flip@bl=
ocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg=
-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
452v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147452v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
52v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-d=
raw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_setmode@basic.htm=
l">PASS</a> +2 other tests pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-6/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-5/igt@kms_setmode@basic.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-6/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl=
-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
52v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-re=
bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-9/igt@xe_faul=
t_injection@oa-add-config-fail-xe_oa_alloc_regs.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#41=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7452v1/shard-adlp-8/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_r=
egs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7=
b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f=
903c7b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc2=
8054f903c7b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe78310=
37bc28054f903c7b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe=
7831037bc28054f903c7b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1=
e98fe7831037bc28054f903c7b/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b9=
9d9f1e98fe7831037bc28054f903c7b/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922-b920=
ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2922=
-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-8/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-a=
dlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c=
7b/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard=
-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/=
shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
52v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-147452v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-a=
dlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147452v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147452v1/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-147452v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-lnl-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-lnl-6/igt@xe_pm@s4-d3h=
ot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47452v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-a=
tomic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-6/igt@kms_big=
_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adlp-2/i=
gt@kms_big_fb@y-tiled-64bpp-rotate-0.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +4 other=
 tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147452v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452=
v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-=
6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-432/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg2-464/igt@k=
ms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-bmg-3/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3=
804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47452v1/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-rmfb-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-dg=
2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
52v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14745=
2v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1474=
52v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47452v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147452v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
452v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-147452v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47452v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@kms_pla=
ne@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/shard-adl=
p-9/igt@kms_plane@pixel-format-source-clamping.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b/shard-adlp-4/igt@kms_pla=
ne@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147452v1/=
shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b -&gt; xe-pw-147=
452v1</li>
</ul>
<p>IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2922-b920ef1b99d9f1e98fe7831037bc28054f903c7b: b920ef1b99d9f1e98fe7831=
037bc28054f903c7b<br />
  xe-pw-147452v1: 147452v1</p>

</body>
</html>

--===============5213642564847804317==--
