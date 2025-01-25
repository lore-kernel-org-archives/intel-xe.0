Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDEEC02182
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jan 2025 03:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3E010E249;
	Sat, 25 Jan 2025 03:55:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022EE10E162;
 Sat, 25 Jan 2025 03:55:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6470021078150335008=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pf=3A_Use_GuC_Buffe?=
 =?utf-8?q?r_Cache_during_policy_provisioning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Jan 2025 03:55:39 -0000
Message-ID: <173777733997.99963.1606818443566568312@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124185247.676-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250124185247.676-1-michal.wajdeczko@intel.com>
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

--===============6470021078150335008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Use GuC Buffer Cache during policy provisioning
URL   : https://patchwork.freedesktop.org/series/143949/
State : failure

== Summary ==

CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7_full -> xe-pw-143949v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143949v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143949v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143949v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_sequence@queue-idle@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_sequence@queue-idle@pipe-b-dp-2.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-4/igt@kms_setmode@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][6] ([Intel XE#3884]) -> [DMESG-FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][8] ([Intel XE#886]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  
Known issues
------------

  Here are the changes found in xe-pw-143949v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2423])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@core_getstats.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@core_getstats.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2134])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@fbdev@eof.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2134])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@fbdev@write.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-433/igt@fbdev@write.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1465])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_3d.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#873])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][19] ([Intel XE#2613])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2370])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2136]) +16 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1033]) +18 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2327])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2191])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2423] / [i915#2575]) +19 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +153 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2669]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#3442])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#3862])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#3432])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2907])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#306])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#373]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#373])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3278])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#307]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2320])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2321])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2321])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#308])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#2423] / [i915#2575]) +59 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#877])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#309])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2286])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([i915#3804])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2423])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3070])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1421])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#3321]) +3 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#2882]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][74] -> [INCOMPLETE][75] ([Intel XE#2049])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a6.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#301]) +6 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#3321]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-panning@b-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][79] ([Intel XE#2049])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_flip@flip-vs-panning@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1397] / [Intel XE#1745])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293] / [Intel XE#2380])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#1033])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][86] -> [FAIL][87] ([Intel XE#1874])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#352])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#651]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4141]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2136]) +30 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#651]) +12 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2352])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#653])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1503])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#346])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2925])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#455]) +9 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#2763]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2763]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][109] ([Intel XE#1430])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#2446])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2446])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1489]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1489]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2893])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1406])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#3414]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3414] / [Intel XE#3904])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#3414] / [Intel XE#3904])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2883]) +2 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1500])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][125] -> [FAIL][126] ([Intel XE#771] / [Intel XE#899])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][127] -> [FAIL][128] ([Intel XE#899])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1499])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#756])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#3889])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2905]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2905])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#688]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-external:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1130]) +31 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1392]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2322]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1130]) +116 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#288]) +10 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2905]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [PASS][142] -> [ABORT][143] ([Intel XE#2625]) +1 other test abort
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_gt_freq@freq_suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#1999]) +2 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2459] / [Intel XE#2596])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#2541] / [Intel XE#3573])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1420])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#979])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#1173]) +1 other test fail
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][151] -> [DMESG-WARN][152] ([Intel XE#2953]) +3 other tests dmesg-warn
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][153] -> [ABORT][154] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) +1 other test abort
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][155] -> [ABORT][156] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#944])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#944]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2134]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@fbdev@unaligned-write.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@fbdev@unaligned-write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#1033]) -> [PASS][162] +2 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][163] ([Intel XE#1033]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][165] ([Intel XE#1033]) -> [PASS][166] +4 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][167] ([Intel XE#2882]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#301]) -> [PASS][170] +4 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][171] ([Intel XE#3321]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-panning@a-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][173] ([Intel XE#2049]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-1/igt@kms_flip@flip-vs-panning@a-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_flip@flip-vs-panning@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][175] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#2953]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][179] ([Intel XE#886]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][183] -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][185] ([Intel XE#1874]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2351]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2136]) -> [PASS][190] +18 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2423] / [i915#2575]) -> [PASS][192] +56 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_lease@lease-invalid-crtc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][193] -> [PASS][194] +10 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2446]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][197] ([Intel XE#899]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1130]) -> [PASS][200] +97 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][201] ([Intel XE#1192]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [SKIP][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228]) ([Intel XE#378]) -> ([PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-1/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-2/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-1/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-6/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-8/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-8/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-2/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [SKIP][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279]) ([Intel XE#378]) -> ([PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][305] ([Intel XE#1358]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][307] ([Intel XE#3084]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [SKIP][310] ([Intel XE#3768])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#316]) -> [SKIP][312] ([Intel XE#2136] / [Intel XE#2351])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#316]) -> [SKIP][314] ([Intel XE#2136]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#316]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1124]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1124]) -> [SKIP][320] ([Intel XE#2136]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#1124]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][323] ([Intel XE#1874]) -> [DMESG-FAIL][324] ([Intel XE#1033])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#619]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2351])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#607])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1124]) -> [SKIP][330] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#367])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2907]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][336] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2136]) -> [INCOMPLETE][340] ([Intel XE#3862])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136]) -> [SKIP][342] ([Intel XE#2907]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][344] ([Intel XE#2136]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136]) -> [SKIP][346] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#306]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#373]) -> [SKIP][350] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2423] / [i915#2575]) -> [SKIP][352] ([Intel XE#373]) +4 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [DMESG-FAIL][353] ([Intel XE#1033]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#455]) -> [SKIP][356] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_content_protection@lic-type-1.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#308]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2423] / [i915#2575]) -> [SKIP][360] ([Intel XE#308])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#323]) -> [SKIP][362] ([Intel XE#2423] / [i915#2575])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2423] / [i915#2575]) -> [SKIP][364] ([Intel XE#323])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][366] ([Intel XE#455])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#455]) +4 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2136]) -> [SKIP][370] ([Intel XE#776])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#703])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1135]) -> [SKIP][374] ([Intel XE#2423] / [i915#2575])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_feature_discovery@psr2.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#301]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2423] / [i915#2575]) -> [FAIL][378] ([Intel XE#301]) +1 other test fail
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [DMESG-FAIL][379] ([Intel XE#1033]) -> [DMESG-WARN][380] ([Intel XE#1033]) +1 other test dmesg-warn
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#455]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#455]) -> [SKIP][384] ([Intel XE#2136]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#651]) -> [SKIP][386] ([Intel XE#2136]) +15 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#651]) -> [SKIP][388] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2136]) -> [SKIP][390] ([Intel XE#651]) +12 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][392] ([Intel XE#651]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][394] ([Intel XE#658])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#653]) +7 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1158]) -> [SKIP][398] ([Intel XE#2136])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136]) -> [SKIP][400] ([Intel XE#653]) +10 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#653]) -> [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#653]) -> [SKIP][404] ([Intel XE#2136]) +18 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#346]) -> [SKIP][406] ([Intel XE#2136])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#2927])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@empty-lease:
    - shard-dg2-set2:     [DMESG-WARN][409] ([Intel XE#1033]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_lease@empty-lease.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_lease@empty-lease.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#870]) -> [SKIP][414] ([Intel XE#2136])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#870]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#908]) -> [SKIP][418] ([Intel XE#2136] / [Intel XE#2351])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1489]) -> [SKIP][420] ([Intel XE#2136]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#1489]) +6 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136]) -> [SKIP][424] ([Intel XE#1122])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1122]) -> [SKIP][426] ([Intel XE#2136])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][428] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2136]) -> [SKIP][430] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][432] ([Intel XE#2136]) +9 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2351]) -> [SKIP][434] ([Intel XE#2850] / [Intel XE#929])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2939]) -> [SKIP][436] ([Intel XE#2136] / [Intel XE#2351])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#3414]) -> [SKIP][438] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2423] / [i915#2575]) -> [SKIP][440] ([Intel XE#3414]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2168]) -> [SKIP][442] ([Intel XE#2423] / [i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_vrr@cmrr.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2423] / [i915#2575]) -> [SKIP][444] ([Intel XE#455]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2423] / [i915#2575]) -> [SKIP][446] ([Intel XE#756]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][448] ([Intel XE#2423] / [i915#2575])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][449] -> [SKIP][450] ([Intel XE#2423])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@testdisplay.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][452] ([Intel XE#1130])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1130]) -> [SKIP][454] ([Intel XE#1123])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1126]) -> [SKIP][456] ([Intel XE#1130])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1130]) -> [SKIP][458] ([Intel XE#3889])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2905]) -> [SKIP][460] ([Intel XE#1130]) +5 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@single-step:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#1130]) -> [SKIP][462] ([Intel XE#2905]) +3 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_eudebug_online@single-step.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1392]) -> [SKIP][464] ([Intel XE#1130])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1130]) -> [SKIP][466] ([Intel XE#1392])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1130]) -> [SKIP][468] ([Intel XE#288]) +15 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#288]) -> [SKIP][470] ([Intel XE#1130]) +23 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2360]) -> [SKIP][472] ([Intel XE#1130])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130]) -> [SKIP][474] ([Intel XE#2360])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][475] ([Intel XE#1192]) -> [SKIP][476] ([Intel XE#2833])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1130]) -> [SKIP][478] ([Intel XE#560])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][480] ([Intel XE#1130]) +5 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1130]) -> [SKIP][482] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1130]) -> [SKIP][484] ([Intel XE#2838] / [Intel XE#979])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1130]) -> [SKIP][486] ([Intel XE#2284])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][488] ([Intel XE#1130])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [ABORT][489] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][490] ([Intel XE#1130])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_pm@s2idle-mocs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [ABORT][492] ([Intel XE#1358])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][493] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][494] ([Intel XE#1130])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [DMESG-WARN][495] ([Intel XE#1033] / [Intel XE#2280]) -> [SKIP][496] ([Intel XE#1130])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_pm@s4-mocs.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#579])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [SKIP][500] ([Intel XE#944])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#944]) -> [SKIP][502] ([Intel XE#1130]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-dg2-set2:     [DMESG-WARN][503] ([Intel XE#1033]) -> [SKIP][504] ([Intel XE#1130]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1130]) -> [SKIP][506] ([Intel XE#4130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2549-b36df02c99e3246ba2a90e951c71797327374db7 -> xe-pw-143949v1

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2549-b36df02c99e3246ba2a90e951c71797327374db7: b36df02c99e3246ba2a90e951c71797327374db7
  xe-pw-143949v1: 143949v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/index.html

--===============6470021078150335008==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Use GuC Buffer Cache during polic=
y provisioning</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143949/">https://patchwork.freedesktop.org/series/143949/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143949v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143949v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c7179732=
7374db7_full -&gt; xe-pw-143949v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143949v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143949v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1439=
49v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-0.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">DMESG-WARN</a> +3 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_sequence@queue-idle@pipe-=
b-dp-2.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-4/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-143949v1/shard-bmg-7/igt@kms_setmode@basic.html">INCOMPLETE<=
/a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-=
4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_f=
lip@plain-flip-ts-check@a-edp1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143949v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@core_g=
etstats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143949v1/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@fbdev@=
eof.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143949v1/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Int=
el XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143949v1/shard-dg2-433/igt@fbdev@write.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_3d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#146=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_atomic_transition@modeset=
-transition-nonblocking-fencing.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-s=
tride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_bi=
g_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@linea=
r-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_bi=
g_fb@linear-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
 +18 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-t=
iled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-f=
or-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid=
-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_dp_aux_dev.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank@d-hdmi-a6.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-433/igt@kms=
_flip@flip-vs-absolute-wf_vblank@d-hdmi-a6.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@d-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip@flip-v=
s-expired-vblank@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_flip@flip-vs-panning@b-hd=
mi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp=
-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
c-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_joiner@invalid-modeset-=
force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_panel_fitting@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">I=
ntel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_pm=
_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_rpm@basic-pc=
i-d3-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-str=
ess-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_psr@fbc-pr-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_psr@fbc-psr-cursor-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_uni=
versal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@kms_universal_pl=
ane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@=
kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@kms_writeback@writeback-check=
-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_eudebug_online@interrupt=
-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_evict@evict-beng-large-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_evict@evict-large-extern=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1130">Intel XE#1130</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_exe=
c_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_exec_ba=
sic@no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +116 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_gt_=
freq@freq_suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@xe_gt_freq@freq_suspend.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_oa@invalid-oa-metric-set-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-cfg.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +3 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143949v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@fbdev@=
unaligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@fbdev@unalign=
ed-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1=
/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143949v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-4/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-7/igt@kms=
_cursor_crc@cursor-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-=
1/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +3 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-1/igt@kms_flip=
@flip-vs-panning@a-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/ig=
t@kms_flip@flip-vs-panning@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/=
igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@kms_fli=
p@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-upscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">INCOMPLETE<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949=
v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-do=
wnscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_=
frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3949v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-blt.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_le=
ase@lease-invalid-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-=
463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +56 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_pip=
e_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">DMESG-WARN</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v=
1/shard-adlp-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-h=
dmi-a-1.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_pm=
_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_pm_=
rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exe=
c_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-=
434/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +97 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@xe_live_=
ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-1/igt@xe_live_ktest@xe_=
mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c7179732737=
4db7/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c717973=
27374db7/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71=
797327374db7/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e95=
1c71797327374db7/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a9=
0e951c71797327374db7/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3=
246ba2a90e951c71797327374db7/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c=
99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36d=
f02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-=
b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-3/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db=
7/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143949v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143949v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143949v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143949v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db=
7/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327=
374db7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c717=
97327374db7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e95=
1c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a=
90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e324=
6ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c9=
9e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36d=
f02c99e3246ba2a90e951c71797327374db7/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549=
-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db=
7/shard-adlp-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327=
374db7/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c717=
97327374db7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e95=
1c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a=
90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e324=
6ba2a90e951c71797327374db7/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143949v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-a=
dlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143949v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/sh=
ard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143949v1/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949=
v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143949v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43949v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shar=
d-adlp-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_pm@=
s2idle-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_p=
m@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-lnl-7/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-lnl-3/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">=
Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@km=
s_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_bi=
g_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms=
_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt=
@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt=
@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard=
-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143949v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rot=
ate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/=
shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel X=
E#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
66/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143949v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">=
Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/=
shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_ch=
amelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-46=
6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v=
1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel=
 XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_co=
ntent_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-46=
6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms=
_content_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/=
igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
949v1/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/=
shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ds=
c@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/sha=
rd-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-46=
3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-d=
g2-436/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143949v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143949v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949=
v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143949v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143949v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb10=
1010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v=
1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143949v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43949v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_joine=
r@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_lease@empty-lease:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_le=
ase@empty-lease.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_lea=
se@empty-lease.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_p=
m_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
66/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ps=
r2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/=
igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-436/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_=
psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/=
igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@kms_p=
sr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard=
-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms_p=
sr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/s=
hard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3949v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@kms=
_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1439=
49v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/sh=
ard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@testdi=
splay.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/s=
hard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
63/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-=
dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_eud=
ebug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_eu=
debug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143949v1/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-=
vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/sha=
rd-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
34/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-4=
66/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/s=
hard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/=
shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-2/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-8/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-463/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v=
1/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe_pat@pat-i=
ndex-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-434/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-=
466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-432/igt@xe_pm@=
s2idle-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@xe=
_pm@s2idle-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@=
s2idle-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-432/igt@xe_pm@s=
2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/=
igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_pm@=
s4-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466/igt@x=
e_pm@s4-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-434/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-463/igt@xe=
_query@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_que=
ry@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2-466=
/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-436/igt@xe_spi=
n_batch@spin-fixed-duration-with-preempter.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v=
1/shard-dg2-466/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-dg2=
-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2549-b36df02c99e3246ba2a90e951c71797327374db7 -&gt; xe-pw-143=
949v1</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2549-b36df02c99e3246ba2a90e951c71797327374db7: b36df02c99e3246ba2a90e9=
51c71797327374db7<br />
  xe-pw-143949v1: 143949v1</p>

</body>
</html>

--===============6470021078150335008==--
