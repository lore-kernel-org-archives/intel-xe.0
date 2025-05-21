Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE13C54E71
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 17:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D8E10E7CF;
	Wed, 21 May 2025 17:15:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FCA10E835;
 Wed, 21 May 2025 17:15:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5364596897753297174=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Add_configfs_to_?=
 =?utf-8?q?load_with_fewer_engines_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 17:15:54 -0000
Message-ID: <174784775484.10286.15766266206497979129@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
In-Reply-To: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
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

--===============5364596897753297174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add configfs to load with fewer engines (rev2)
URL   : https://patchwork.freedesktop.org/series/149259/
State : success

== Summary ==

CI Bug Log - changes from xe-3116-45abc70af791052c25beeb400aece4dab51020cd_FULL -> xe-pw-149259v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-149259v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#4208]) +26 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#873])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][3], [SKIP][4]) ([Intel XE#2327]) +2 other tests ( 2 skip )
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][6] -> ([DMESG-FAIL][7], [PASS][8]) ([Intel XE#4543])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][9], [SKIP][10]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][11], [SKIP][12]) ([Intel XE#610])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#2328])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][22] -> ([PASS][23], [SKIP][24]) ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#2314] / [Intel XE#2894]) +1 other test ( 2 skip )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +146 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#787]) +27 other tests ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#2887]) +6 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#787]) +11 other tests ( 2 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#3432]) +1 other test ( 2 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +11 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#2652] / [Intel XE#787]) +18 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#455] / [Intel XE#787]) +3 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#2724])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#4417]) +3 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#2325])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#373])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_chamelium_frames@vga-frame-dump.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2252]) +7 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2252]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#373]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-lnl:          NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2341])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][70] ([Intel XE#3304])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#1178])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1188])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-bmg:          NOTRUN -> ([PASS][73], [SKIP][74]) ([Intel XE#2320] / [Intel XE#5042])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2321])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#1424])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#2320]) +2 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#2321]) +1 other test ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#308])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2320]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#2286]) +2 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][87], [PASS][88]) ([Intel XE#2291]) +3 other tests ( 1 pass, 1 skip )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][89] -> ([SKIP][90], [PASS][91]) ([Intel XE#4208] / [i915#2575]) +1 other test ( 1 pass, 1 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          NOTRUN -> ([SKIP][92], [PASS][93]) ([Intel XE#2291] / [Intel XE#5042])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#309])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][96] -> ([SKIP][97], [PASS][98]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#323])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#1508])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][103] -> ([PASS][104], [SKIP][105]) ([Intel XE#4302])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1340])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#4331])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2244])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> ([SKIP][110], [SKIP][111]) ([Intel XE#2244])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#2244])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#4422])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4156])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2372])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#1138])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2375])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([Intel XE#2374])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_feature_discovery@psr1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2374])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> ([PASS][124], [FAIL][125]) ([Intel XE#2882] / [Intel XE#3333])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][126], [FAIL][127]) ([Intel XE#2882]) +5 other tests ( 1 fail, 1 pass )
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][128], [FAIL][129]) ([Intel XE#301] / [Intel XE#3321])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][130], [FAIL][131]) ([Intel XE#301]) +1 other test ( 2 fail )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][132], [PASS][133]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][134], [PASS][135]) ([Intel XE#301] / [Intel XE#3321])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][136], [FAIL][137]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#310]) +1 other test ( 2 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#1421]) +2 other tests ( 2 skip )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> ([PASS][142], [SKIP][143]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][144] -> ([SKIP][145], [PASS][146]) ([Intel XE#2316]) +7 other tests ( 1 pass, 1 skip )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> ([FAIL][147], [FAIL][148]) ([Intel XE#301]) +1 other test ( 2 fail )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#301]) +2 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#301] / [Intel XE#3321])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> ([FAIL][151], [FAIL][152]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 2 fail )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][153] -> ([FAIL][154], [PASS][155]) ([Intel XE#2882]) +2 other tests ( 1 fail, 1 pass )
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [PASS][156] -> ([PASS][157], [FAIL][158]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#2293] / [Intel XE#2380]) +1 other test ( 2 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][161], [SKIP][162]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> ([SKIP][163], [SKIP][164]) ([Intel XE#455]) +2 other tests ( 2 skip )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#1401] / [Intel XE#1745])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][167], [SKIP][168]) ([Intel XE#1401])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2293]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][171] -> ([PASS][172], [SKIP][173]) ([Intel XE#2351] / [Intel XE#4208])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#651]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
    - shard-lnl:          NOTRUN -> ([SKIP][177], [SKIP][178]) ([Intel XE#651]) +1 other test ( 2 skip )
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([Intel XE#2311] / [Intel XE#5042]) +1 other test ( 2 skip )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2311]) +21 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#4141]) +12 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][185], [SKIP][186]) ([Intel XE#4141]) +7 other tests ( 2 skip )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#656]) +7 other tests ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [PASS][189] -> ([DMESG-WARN][190], [PASS][191]) ([Intel XE#2953] / [Intel XE#4173]) +1 other test ( 1 dmesg-warn, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#651]) +1 other test ( 2 skip )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2311] / [Intel XE#2312]) +7 other tests ( 2 skip )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([Intel XE#2311] / [Intel XE#2312] / [Intel XE#5042])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2313]) +19 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#2313]) +7 other tests ( 2 skip )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][201], [SKIP][202]) ([Intel XE#2313] / [Intel XE#5042]) +1 other test ( 2 skip )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#653]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][204], [SKIP][205]) ([Intel XE#2312] / [Intel XE#2313] / [Intel XE#5042])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([Intel XE#2312] / [Intel XE#2313]) +6 other tests ( 2 skip )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([Intel XE#656]) +7 other tests ( 2 skip )
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2502])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#3374] / [Intel XE#3544])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][215] -> ([PASS][216], [SKIP][217]) ([Intel XE#1503]) +2 other tests ( 1 pass, 1 skip )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_hdr@static-swap.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_hdr@static-swap.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2927])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
    - shard-lnl:          NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#2927])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#346])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#2486]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-bmg:          NOTRUN -> ([PASS][223], [SKIP][224]) ([Intel XE#4848] / [Intel XE#5042])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][226] -> ([SKIP][227], [PASS][228]) ([Intel XE#4596])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-lnl:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#4596])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][231] -> ([PASS][232], [SKIP][233]) ([Intel XE#2571])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#2763]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
    - shard-lnl:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#2763]) +4 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#870]) +1 other test ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#870])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#2391])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#3309])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][246], [SKIP][247]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-bmg:          NOTRUN -> ([FAIL][248], [FAIL][249]) ([Intel XE#5017])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_properties@get_properties-sanity-atomic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#2893])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#1489]) +4 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2893] / [Intel XE#4608])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#4608]) +1 other test ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#1489])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][260] ([Intel XE#1489]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#1489]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#2387])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#1122])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#2850] / [Intel XE#929])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-blt.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2414])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> ([SKIP][274], [SKIP][275]) ([Intel XE#3414])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> ([SKIP][276], [SKIP][277]) ([Intel XE#3414] / [Intel XE#3904])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#2330])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#2413])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#1499])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2168])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_vrr@lobf.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#455])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-lnl:          NOTRUN -> ([SKIP][286], [SKIP][287]) ([Intel XE#1499])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [SKIP][289]) ([Intel XE#756])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#1091] / [Intel XE#2849])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#1447])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#2504])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-adlp:         NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#4837])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> ([SKIP][298], [SKIP][299]) ([Intel XE#4837]) +8 other tests ( 2 skip )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][300] ([Intel XE#4837])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
    - shard-lnl:          NOTRUN -> ([SKIP][301], [SKIP][302]) ([Intel XE#4837])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][303] ([Intel XE#4837]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> ([SKIP][304], [SKIP][305]) ([Intel XE#4518])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> ([SKIP][306], [SKIP][307]) ([Intel XE#4519])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> ([SKIP][308], [SKIP][309]) ([Intel XE#688])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_evict@evict-beng-large-multi-vm.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#688])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][312] -> ([SKIP][313], [PASS][314]) ([Intel XE#4208]) +1 other test ( 1 pass, 1 skip )
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#2322]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> ([SKIP][316], [SKIP][317]) ([Intel XE#1392])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#2322]) +3 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [PASS][320] -> [SKIP][321] ([Intel XE#1392]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> ([SKIP][322], [SKIP][323]) ([Intel XE#1392]) +1 other test ( 2 skip )
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][324] ([Intel XE#288]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - shard-adlp:         NOTRUN -> ([SKIP][325], [SKIP][326]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-rebind-imm.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-rebind-imm.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> ([SKIP][327], [SKIP][328]) ([Intel XE#4943]) +19 other tests ( 2 skip )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][329] ([Intel XE#4915]) +35 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_system_allocator@many-mmap-huge.html
    - shard-lnl:          NOTRUN -> ([SKIP][330], [SKIP][331]) ([Intel XE#4943]) +5 other tests ( 2 skip )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-huge.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_exec_system_allocator@many-mmap-huge.html

  * igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:
    - shard-bmg:          NOTRUN -> ([PASS][332], [DMESG-WARN][333]) ([Intel XE#3428]) +6 other tests ( 1 dmesg-warn, 1 pass )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - shard-adlp:         NOTRUN -> ([SKIP][334], [SKIP][335]) ([Intel XE#4915]) +41 other tests ( 2 skip )
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_system_allocator@process-many-execqueues-free.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_system_allocator@process-many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][336] ([Intel XE#4943]) +18 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][337] -> ([FAIL][338], [PASS][339]) ([Intel XE#5018]) +1 other test ( 1 fail, 1 pass )
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> ([ABORT][340], [ABORT][341]) ([Intel XE#4917])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2833])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][344] ([Intel XE#2459] / [Intel XE#2596])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][345] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         NOTRUN -> ([SKIP][346], [SKIP][347]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#1420])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][349] ([Intel XE#2245])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#2236])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][351] ([Intel XE#2427])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          NOTRUN -> ([FAIL][352], [PASS][353]) ([Intel XE#4938])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> ([SKIP][354], [SKIP][355]) ([Intel XE#2284] / [Intel XE#366])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][356] -> ([ABORT][357], [PASS][358]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][359] -> ([PASS][360], [ABORT][361]) ([Intel XE#1794])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][362] ([Intel XE#4733])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> ([SKIP][363], [SKIP][364]) ([Intel XE#4733]) +1 other test ( 2 skip )
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][365] ([Intel XE#944]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#944])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_query@multigpu-query-engines.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][368] ([Intel XE#944])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#944])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][371] ([Intel XE#4130])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][372], [SKIP][373]) ([Intel XE#4130])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#3342])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][376] ([Intel XE#4351])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][377] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-bmg:          [SKIP][379] ([Intel XE#2320] / [Intel XE#5042]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][381] ([Intel XE#2291]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][383] ([Intel XE#2291]) -> ([PASS][384], [PASS][385])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][386] ([Intel XE#1475]) -> ([PASS][387], [PASS][388])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [DMESG-WARN][389] ([Intel XE#3428]) -> [PASS][390] +8 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-bmg:          [SKIP][391] ([Intel XE#4879]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][393] ([Intel XE#3009]) -> ([PASS][394], [PASS][395])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_dp_aux_dev.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_dp_aux_dev.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][396] ([Intel XE#2316]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][398] ([Intel XE#2316]) -> ([PASS][399], [PASS][400]) +3 other tests ( 2 pass )
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][401] ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][402], [PASS][403]) +2 other tests ( 2 pass )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][404] ([Intel XE#886]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][406] ([Intel XE#2882]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][408] ([Intel XE#2882]) -> ([PASS][409], [PASS][410])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@b-dp2:
    - shard-bmg:          [FAIL][411] ([Intel XE#2882]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@b-dp2.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@b-dp2.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][413] ([Intel XE#3012]) -> ([PASS][414], [PASS][415])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [TIMEOUT][416] ([Intel XE#5089]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_lease@lease-uevent.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [DMESG-WARN][418] ([Intel XE#4173]) -> ([PASS][419], [PASS][420]) +6 other tests ( 2 pass )
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-6/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [FAIL][421] ([Intel XE#4783]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_sequence@queue-idle.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_sequence@queue-idle.html

  * igt@kms_universal_plane@universal-plane-functional:
    - shard-adlp:         [DMESG-WARN][423] ([Intel XE#4173]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@kms_universal_plane@universal-plane-functional.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@kms_universal_plane@universal-plane-functional.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1392]) -> ([PASS][426], [PASS][427]) +1 other test ( 2 pass )
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#1392]) -> [PASS][429] +6 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][430] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@xe_module_load@many-reload.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][432] ([Intel XE#1794]) -> ([PASS][433], [PASS][434])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@xe_pm@s4-basic.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s4-basic.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][435] ([Intel XE#1794]) -> ([PASS][436], [PASS][437])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][438] ([Intel XE#4543]) -> ([DMESG-FAIL][439], [PASS][440]) ([Intel XE#4543])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1124]) -> ([SKIP][442], [SKIP][443]) ([Intel XE#1124] / [Intel XE#2351] / [Intel XE#4208])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][444] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][445] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][446] ([Intel XE#2341] / [Intel XE#5042]) -> [SKIP][447] ([Intel XE#2341])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][448] ([Intel XE#2341]) -> [FAIL][449] ([Intel XE#1178])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_content_protection@srm.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-alpha-transparent:
    - shard-dg2-set2:     [INCOMPLETE][450] ([Intel XE#4148]) -> [SKIP][451] ([Intel XE#4208] / [i915#2575])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_cursor_crc@cursor-alpha-transparent.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_cursor_crc@cursor-alpha-transparent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][452] ([Intel XE#2320] / [Intel XE#5042]) -> [SKIP][453] ([Intel XE#2320])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [DMESG-WARN][454] ([Intel XE#3428]) -> [SKIP][455] ([Intel XE#2316])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [FAIL][456] ([Intel XE#2882] / [Intel XE#3333]) -> [SKIP][457] ([Intel XE#2316])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][458] ([Intel XE#2316]) -> ([FAIL][459], [PASS][460]) ([Intel XE#3321])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][461] ([Intel XE#2316]) -> ([SKIP][462], [PASS][463]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][464] ([Intel XE#2293] / [Intel XE#2380] / [Intel XE#5042]) -> [SKIP][465] ([Intel XE#2293] / [Intel XE#2380])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [SKIP][466] ([Intel XE#2293] / [Intel XE#5042]) -> [SKIP][467] ([Intel XE#2293])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][468] ([Intel XE#2312]) -> ([SKIP][469], [SKIP][470]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][471] ([Intel XE#2311]) -> ([SKIP][472], [SKIP][473]) ([Intel XE#2311] / [Intel XE#2312]) +16 other tests ( 2 skip )
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][474] ([Intel XE#2311]) -> [SKIP][475] ([Intel XE#2312]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][476] ([Intel XE#2312]) -> ([SKIP][477], [SKIP][478]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#651]) -> ([SKIP][480], [SKIP][481]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#651])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][482] ([Intel XE#2312]) -> [SKIP][483] ([Intel XE#4141]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][484] ([Intel XE#2312]) -> ([SKIP][485], [SKIP][486]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][487] ([Intel XE#2312]) -> ([SKIP][488], [SKIP][489]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][490] ([Intel XE#4141]) -> [SKIP][491] ([Intel XE#2312])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][492] ([Intel XE#4141]) -> ([SKIP][493], [SKIP][494]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][495] ([Intel XE#2311] / [Intel XE#5042]) -> [SKIP][496] ([Intel XE#2311]) +3 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][497] ([Intel XE#2312]) -> [SKIP][498] ([Intel XE#2311]) +4 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#658]) -> ([SKIP][500], [SKIP][501]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#658])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][502] ([Intel XE#2312]) -> ([SKIP][503], [SKIP][504]) ([Intel XE#2313]) +7 other tests ( 2 skip )
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][505] ([Intel XE#2312]) -> [SKIP][506] ([Intel XE#2313]) +3 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][507] ([Intel XE#2312] / [Intel XE#5042]) -> [SKIP][508] ([Intel XE#2312]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][509] ([Intel XE#2313]) -> [SKIP][510] ([Intel XE#2312])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][511] ([Intel XE#2313]) -> ([SKIP][512], [SKIP][513]) ([Intel XE#2312] / [Intel XE#2313]) +17 other tests ( 2 skip )
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][514] ([Intel XE#2312]) -> ([SKIP][515], [SKIP][516]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][517] ([Intel XE#4596]) -> ([SKIP][518], [SKIP][519]) ([Intel XE#5021])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-bmg:          [DMESG-FAIL][520] ([Intel XE#3428]) -> [FAIL][521] ([Intel XE#5017])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_properties@get_properties-sanity-non-atomic.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][522] ([Intel XE#2509]) -> ([SKIP][523], [SKIP][524]) ([Intel XE#2426])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#455]) -> ([SKIP][526], [SKIP][527]) ([Intel XE#4208] / [Intel XE#455] / [i915#2575])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-virtual.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#4837]) -> ([SKIP][529], [SKIP][530]) ([Intel XE#4208] / [Intel XE#4837])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_eudebug@discovery-empty.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_eudebug@discovery-empty.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1392]) -> ([PASS][532], [SKIP][533]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#4915]) -> ([SKIP][535], [SKIP][536]) ([Intel XE#4208] / [Intel XE#4915]) +6 other tests ( 2 skip )
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#2541] / [Intel XE#3573]) -> ([SKIP][538], [SKIP][539]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4208])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_oa@invalid-oa-exponent.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#4733]) -> ([SKIP][541], [SKIP][542]) ([Intel XE#4208] / [Intel XE#4733])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4848
  [Intel XE#4879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4938
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
  [Intel XE#5089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5089
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3116-45abc70af791052c25beeb400aece4dab51020cd -> xe-pw-149259v2

  IGT_8371: 8371
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd
  xe-pw-149259v2: 149259v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/index.html

--===============5364596897753297174==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add configfs to load with fewer engines (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149259/">https://patchwork.freedesktop.org/series/149259/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3116-45abc70af791052c25beeb400aece4dab51020cd_FULL -&gt; xe-pw-149259v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149259v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_crc@cursor-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_feature_discovery@psr1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_feature_discovery@psr1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +5 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_hdr@static-swap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_hdr@static-swap.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4848">Intel XE#4848</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_properties@get_properties-sanity-atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_properties@get_properties-sanity-atomic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_basic@many-bindexecqueue-userptr-invalidate.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-rebind-imm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-rebind-imm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_system_allocator@many-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +35 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-huge.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_exec_system_allocator@many-mmap-huge.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +6 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_exec_system_allocator@process-many-execqueues-free.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_exec_system_allocator@process-many-execqueues-free.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +41 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_pm@d3hot-mmap-system.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4938">Intel XE#4938</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_query@multigpu-query-engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-1/igt@xe_query@multigpu-query-engines.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_query@multigpu-query-gt-list.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879">Intel XE#4879</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@b-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_lease@lease-uevent.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5089">Intel XE#5089</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_lease@lease-uevent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-6/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html">PASS</a>) +6 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_sequence@queue-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783">Intel XE#4783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_sequence@queue-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@kms_universal_plane@universal-plane-functional.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@kms_universal_plane@universal-plane-functional.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-4/igt@xe_pm@s4-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_cursor_crc@cursor-alpha-transparent.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148">Intel XE#4148</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_cursor_crc@cursor-alpha-transparent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-6/igt@kms_properties@get_properties-sanity-non-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-4/igt@kms_properties@get_properties-sanity-non-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_eudebug@discovery-empty.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_eudebug@discovery-empty.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3116-45abc70af791052c25beeb400aece4dab51020cd/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-436/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3116-45abc70af791052c25beeb400aece4dab51020cd -&gt; xe-pw-149259v2</li>
</ul>
<p>IGT_8371: 8371<br />
  xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 45abc70af791052c25beeb400aece4dab51020cd<br />
  xe-pw-149259v2: 149259v2</p>

</body>
</html>

--===============5364596897753297174==--
