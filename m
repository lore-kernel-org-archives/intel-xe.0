Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44231C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 19:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3610E6CB;
	Wed, 30 Jul 2025 19:00:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEC610E6CA;
 Wed, 30 Jul 2025 19:00:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8252638259650163568=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Prepare_GPU_SVM_for_migrat?=
 =?utf-8?q?ion_of_THP_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 19:00:58 -0000
Message-ID: <175390205841.199971.15931989790935785751@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730142357.3851167-1-francois.dugast@intel.com>
In-Reply-To: <20250730142357.3851167-1-francois.dugast@intel.com>
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

--===============8252638259650163568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare GPU SVM for migration of THP (rev3)
URL   : https://patchwork.freedesktop.org/series/151754/
State : failure

== Summary ==

CI Bug Log - changes from xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796_FULL -> xe-pw-151754v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151754v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151754v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151754v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +4 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [SKIP][3] ([Intel XE#4945]) -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck.html

  
Known issues
------------

  Here are the changes found in xe-pw-151754v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#4672])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@core_getversion@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#4963]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@fbdev@nullptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@fbdev@read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#911]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#3884]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_interruptible@legacy-pageflip:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@kms_atomic_interruptible@legacy-pageflip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_atomic_interruptible@legacy-pageflip.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#4947]) +21 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#316]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#4543]) +8 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][28] ([Intel XE#4543]) +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#607])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#607])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1477])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2191])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2191]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#787]) +20 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2887]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#2907])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +146 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#373]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1468])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2341])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_content_protection@type1.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#3278])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#1188])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#308])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2320])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1424])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2291])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#309])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#323])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#323])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#323])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1340])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4494] / [i915#3804])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#776])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#776])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2316]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1421]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#310]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4950]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][75] ([Intel XE#1504]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#301]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][80] -> [DMESG-WARN][81] ([Intel XE#4543]) +10 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][82] ([Intel XE#4543]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401] / [Intel XE#1745])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293] / [Intel XE#2380])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#651]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#651]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#656]) +12 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#5390]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#653]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4947]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#455])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#3012])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4090])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2925])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2925])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#616]) +2 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#5020])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#870])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1131])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#4962]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [PASS][112] -> [ABORT][113] ([Intel XE#5545])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#4950]) +105 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1489]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1489]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1127])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#3414])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#3414]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#3414] / [Intel XE#3904])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [FAIL][127] ([Intel XE#4689])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1127])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#362])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#1729])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#362])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#455]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_vrr@flip-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#455]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#2168])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2168])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1499])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1447] / [Intel XE#5596])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#5249])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_configfs@survivability-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#5249])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@xe_configfs@survivability-mode.html
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#5249])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1123])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4837]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#4837]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#4837] / [Intel XE#5565]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#4519])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2322])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][148] -> [SKIP][149] ([Intel XE#1392]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#4208]) +15 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1392]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#288] / [Intel XE#5561]) +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#288]) +12 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4837]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#4915] / [Intel XE#5560]) +81 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#4945]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#4915]) +99 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#4943]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-8/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4943])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][162] -> [SKIP][163] ([Intel XE#4945]) +532 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][164] ([Intel XE#5531])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#3573]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#3573]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2838] / [Intel XE#979])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#4733] / [Intel XE#5594]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4733]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#944]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#944])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@xe_query@multigpu-query-gt-list.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][173] ([Intel XE#4672]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][175] ([Intel XE#2134]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@fbdev@pan.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@fbdev@pan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][177] -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [DMESG-WARN][179] -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_addfb_basic@legacy-format.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][181] ([Intel XE#4947]) -> [PASS][182] +17 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#4543]) -> [PASS][184] +9 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][185] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][189] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][191] ([Intel XE#2291]) -> [PASS][192] +3 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][193] ([Intel XE#4302]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][195] ([Intel XE#2316]) -> [PASS][196] +3 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-panning@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][197] ([Intel XE#4543]) -> [PASS][198] +16 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_flip@flip-vs-panning@d-hdmi-a1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_flip@flip-vs-panning@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][199] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][201] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][203] ([Intel XE#1503]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][205] ([Intel XE#3012]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [SKIP][207] ([Intel XE#4950]) -> [PASS][208] +92 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][209] ([Intel XE#718]) -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][211] ([Intel XE#4962]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][213] ([Intel XE#4459]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][215] ([Intel XE#1499]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1392]) -> [PASS][218] +4 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][219] ([Intel XE#4945]) -> [PASS][220] +424 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [FAIL][221] ([Intel XE#5679]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_module_load@reload-no-display.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][223] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][224] +8 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [ABORT][225] ([Intel XE#5545]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][227] ([Intel XE#2233]) -> [SKIP][228] ([Intel XE#4950])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][229] ([Intel XE#4950]) -> [SKIP][230] ([Intel XE#2370]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][231] ([Intel XE#4947]) -> [SKIP][232] ([Intel XE#2327]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][233] ([Intel XE#2327]) -> [SKIP][234] ([Intel XE#4947]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1124]) -> [SKIP][236] ([Intel XE#4208])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][237] ([Intel XE#2328]) -> [SKIP][238] ([Intel XE#4947])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][239] ([Intel XE#4947]) -> [SKIP][240] ([Intel XE#1124]) +10 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][241] ([Intel XE#4947]) -> [SKIP][242] ([Intel XE#607])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][243] ([Intel XE#1124]) -> [SKIP][244] ([Intel XE#4947]) +15 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][245] ([Intel XE#4950]) -> [SKIP][246] ([Intel XE#2314] / [Intel XE#2894])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][247] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][248] ([Intel XE#4950])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][249] ([Intel XE#4950]) -> [SKIP][250] ([Intel XE#367])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][251] ([Intel XE#367]) -> [SKIP][252] ([Intel XE#4950]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#367]) -> [SKIP][254] ([Intel XE#4208] / [i915#2575])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][255] ([Intel XE#4947]) -> [SKIP][256] ([Intel XE#2887]) +13 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][257] ([Intel XE#2887]) -> [SKIP][258] ([Intel XE#4947]) +18 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][259] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][260] ([Intel XE#4947]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][261] ([Intel XE#4947]) -> [SKIP][262] ([Intel XE#3432]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][263] ([Intel XE#3432]) -> [SKIP][264] ([Intel XE#4947]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][265] ([Intel XE#4947]) -> [SKIP][266] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][268] ([Intel XE#4208])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][270] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][271] ([Intel XE#2724]) -> [SKIP][272] ([Intel XE#4947])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cdclk@plane-scaling.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][273] ([Intel XE#2325]) -> [SKIP][274] ([Intel XE#4950])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][275] ([Intel XE#4950]) -> [SKIP][276] ([Intel XE#2325]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_chamelium_color@gamma.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][277] ([Intel XE#4950]) -> [SKIP][278] ([Intel XE#2252]) +9 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#373]) -> [SKIP][280] ([Intel XE#4208] / [i915#2575])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-434/igt@kms_chamelium_edid@dp-mode-timings.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][281] ([Intel XE#2252]) -> [SKIP][282] ([Intel XE#4950]) +13 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][283] ([Intel XE#1178]) -> [SKIP][284] ([Intel XE#4950])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_content_protection@atomic.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][285] ([Intel XE#2341]) -> [SKIP][286] ([Intel XE#4950])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][287] ([Intel XE#2390]) -> [SKIP][288] ([Intel XE#4950])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][289] ([Intel XE#4950]) -> [SKIP][290] ([Intel XE#2390])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][291] ([Intel XE#1178]) -> [SKIP][292] ([Intel XE#2341])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][293] ([Intel XE#4950]) -> [SKIP][294] ([Intel XE#2341]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][295] ([Intel XE#2341]) -> [FAIL][296] ([Intel XE#1188])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_content_protection@uevent.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][297] ([Intel XE#4950]) -> [SKIP][298] ([Intel XE#2320]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][299] ([Intel XE#2320]) -> [SKIP][300] ([Intel XE#4950]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][301] ([Intel XE#2321]) -> [SKIP][302] ([Intel XE#4950]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][303] ([Intel XE#2291]) -> [SKIP][304] ([Intel XE#4950]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][305] ([Intel XE#4950]) -> [SKIP][306] ([Intel XE#2291]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][307] ([Intel XE#4633]) -> [SKIP][308] ([Intel XE#4950])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][309] ([Intel XE#4950]) -> [SKIP][310] ([Intel XE#2286])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][311] ([Intel XE#2244]) -> [SKIP][312] ([Intel XE#4947])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][313] ([Intel XE#4947]) -> [SKIP][314] ([Intel XE#2244]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][315] ([Intel XE#4422]) -> [SKIP][316] ([Intel XE#4945])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][317] ([Intel XE#4947]) -> [SKIP][318] ([Intel XE#5425]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][319] ([Intel XE#4947]) -> [SKIP][320] ([Intel XE#776])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][321] ([Intel XE#2373]) -> [SKIP][322] ([Intel XE#4950])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_feature_discovery@display-3x.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][323] ([Intel XE#4950]) -> [SKIP][324] ([Intel XE#2375])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][325] ([Intel XE#4947]) -> [SKIP][326] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][327] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][328] ([Intel XE#4947]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][329] ([Intel XE#2312]) -> [SKIP][330] ([Intel XE#2311]) +7 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][331] ([Intel XE#2311]) -> [SKIP][332] ([Intel XE#2312]) +7 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][333] ([Intel XE#4947]) -> [SKIP][334] ([Intel XE#2311]) +27 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][335] ([Intel XE#4947]) -> [SKIP][336] ([Intel XE#5390]) +15 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][337] ([Intel XE#2312]) -> [SKIP][338] ([Intel XE#5390])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][339] ([Intel XE#5390]) -> [SKIP][340] ([Intel XE#2312]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][341] ([Intel XE#5390]) -> [SKIP][342] ([Intel XE#4947]) +16 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][343] ([Intel XE#4947]) -> [SKIP][344] ([Intel XE#2352])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#651]) -> [SKIP][346] ([Intel XE#4208]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][347] ([Intel XE#2312]) -> [SKIP][348] ([Intel XE#4947]) +8 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][349] ([Intel XE#2311]) -> [SKIP][350] ([Intel XE#4947]) +31 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][351] ([Intel XE#4947]) -> [SKIP][352] ([Intel XE#2312]) +9 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][353] ([Intel XE#2313]) -> [SKIP][354] ([Intel XE#2312]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][355] ([Intel XE#2312]) -> [SKIP][356] ([Intel XE#2313]) +9 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][357] ([Intel XE#2313]) -> [SKIP][358] ([Intel XE#4947]) +39 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][359] ([Intel XE#4947]) -> [SKIP][360] ([Intel XE#2313]) +26 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#653]) -> [SKIP][362] ([Intel XE#4208]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][363] ([Intel XE#4950]) -> [SKIP][364] ([Intel XE#1503])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][365] ([Intel XE#4947]) -> [SKIP][366] ([Intel XE#2934]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][367] ([Intel XE#346]) -> [SKIP][368] ([Intel XE#4947])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][369] ([Intel XE#4947]) -> [SKIP][370] ([Intel XE#2927])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][371] ([Intel XE#4950]) -> [SKIP][372] ([Intel XE#2501])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][373] ([Intel XE#2763]) -> [SKIP][374] ([Intel XE#4950]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][375] ([Intel XE#4947]) -> [SKIP][376] ([Intel XE#2938])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][377] ([Intel XE#4947]) -> [SKIP][378] ([Intel XE#870])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][379] ([Intel XE#2392]) -> [SKIP][380] ([Intel XE#4947])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][381] ([Intel XE#4947]) -> [SKIP][382] ([Intel XE#2499])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][383] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][384] ([Intel XE#4962])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][385] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][386] ([Intel XE#4962])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][387] ([Intel XE#4962]) -> [SKIP][388] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][389] ([Intel XE#1489]) -> [SKIP][390] ([Intel XE#4947]) +8 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1489]) -> [SKIP][392] ([Intel XE#4208])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][393] ([Intel XE#4947]) -> [SKIP][394] ([Intel XE#1489]) +9 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][395] ([Intel XE#2387]) -> [SKIP][396] ([Intel XE#4947])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][398] ([Intel XE#2351] / [Intel XE#4208])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][399] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][400] ([Intel XE#4947]) +20 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_psr@psr-basic.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][401] ([Intel XE#4947]) -> [SKIP][402] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][404] ([Intel XE#4208])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@kms_psr@psr2-primary-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][405] ([Intel XE#4950]) -> [SKIP][406] ([Intel XE#3414] / [Intel XE#3904])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][407] ([Intel XE#4950]) -> [SKIP][408] ([Intel XE#2330])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][409] ([Intel XE#2330]) -> [SKIP][410] ([Intel XE#4950]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][411] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][412] ([Intel XE#4950])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][413] ([Intel XE#4950]) -> [SKIP][414] ([Intel XE#2450])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][415] ([Intel XE#2168]) -> [SKIP][416] ([Intel XE#4950])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@cmrr.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][417] ([Intel XE#4950]) -> [SKIP][418] ([Intel XE#1499]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][419] ([Intel XE#4950]) -> [SKIP][420] ([Intel XE#2168])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_vrr@lobf.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][421] ([Intel XE#1499]) -> [SKIP][422] ([Intel XE#4950]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@max-min.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][423] ([Intel XE#4950]) -> [SKIP][424] ([Intel XE#1091] / [Intel XE#2849])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][425] ([Intel XE#4945]) -> [SKIP][426] ([Intel XE#2504])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][427] ([Intel XE#4837]) -> [SKIP][428] ([Intel XE#4945]) +15 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][429] ([Intel XE#4945]) -> [SKIP][430] ([Intel XE#4837]) +13 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][431] ([Intel XE#4518]) -> [SKIP][432] ([Intel XE#4945])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][433] ([Intel XE#4945]) -> [SKIP][434] ([Intel XE#4518])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][435] ([Intel XE#4945]) -> [SKIP][436] ([Intel XE#2322]) +7 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][437] ([Intel XE#2322]) -> [SKIP][438] ([Intel XE#4945]) +9 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#288]) -> [SKIP][440] ([Intel XE#4208])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-invalidate.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - shard-bmg:          [SKIP][441] ([Intel XE#4945]) -> [SKIP][442] ([Intel XE#4943]) +24 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][443] ([Intel XE#4943]) -> [SKIP][444] ([Intel XE#4945]) +25 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-malloc-fork-read:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#4915]) -> [SKIP][446] ([Intel XE#4208]) +15 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@xe_exec_system_allocator@twice-malloc-fork-read.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_exec_system_allocator@twice-malloc-fork-read.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][447] ([Intel XE#5466]) -> [ABORT][448] ([Intel XE#4917] / [Intel XE#5466])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#3573]) -> [SKIP][450] ([Intel XE#4208])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@xe_oa@mi-rpc.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][451] ([Intel XE#4945]) -> [SKIP][452] ([Intel XE#2248])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][453] ([Intel XE#4945]) -> [SKIP][454] ([Intel XE#1420])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][455] ([Intel XE#4945]) -> [SKIP][456] ([Intel XE#2245])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][457] ([Intel XE#4945]) -> [SKIP][458] ([Intel XE#5694])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][459] ([Intel XE#2284]) -> [SKIP][460] ([Intel XE#4945]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2284]) -> [SKIP][462] ([Intel XE#4208])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][463] ([Intel XE#4945]) -> [SKIP][464] ([Intel XE#2284]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][465] ([Intel XE#4650]) -> [SKIP][466] ([Intel XE#4945]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@xe_pmu@fn-engine-activity-load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][467] ([Intel XE#4733]) -> [SKIP][468] ([Intel XE#4945]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@xe_pxp@display-black-pxp-fb.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][469] ([Intel XE#4945]) -> [SKIP][470] ([Intel XE#4733]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][471] ([Intel XE#4945]) -> [SKIP][472] ([Intel XE#944])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][473] ([Intel XE#944]) -> [SKIP][474] ([Intel XE#4945]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#944]) -> [SKIP][476] ([Intel XE#4208])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_query@multigpu-query-pxp-status.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][477] ([Intel XE#4130]) -> [SKIP][478] ([Intel XE#4945])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][479] ([Intel XE#4351]) -> [SKIP][480] ([Intel XE#4945])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [SKIP][481] ([Intel XE#4945]) -> [SKIP][482] ([Intel XE#4351])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5531
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5596
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8478 -> IGT_8479
  * Linux: xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796 -> xe-pw-151754v3

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796: e1805ad9a7175457902ae453ea67b76194e7d796
  xe-pw-151754v3: 151754v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/index.html

--===============8252638259650163568==
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
<tr><td><b>Series:</b></td><td>Prepare GPU SVM for migration of THP (rev3)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151754/">https://patchwork.freedesktop.org/series/151754/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151754v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151754v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3489-e1805ad9a7175457902ae453ea67b7619=
4e7d796_FULL -&gt; xe-pw-151754v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151754v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151754v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1517=
54v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-stride-mmap-remap-eocheck.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard=
-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck.=
html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-stride-mmap-remap-dontunmap-eocheck:<=
ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-mmap-remap-dontunmap-eocheck.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel X=
E#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151754v3/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-mmap-remap-=
dontunmap-eocheck.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151754v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672"=
>Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4963">Intel XE#4963</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@fbdev@nu=
llptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151754v3/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@fbdev@=
read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151754v3/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1754v3/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@kms_at=
omic_interruptible@legacy-pageflip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_atom=
ic_interruptible@legacy-pageflip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_big_=
fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@linear-=
16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-a=
dlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 othe=
r test dmesg-fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_ccs@bad-pixel-format-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_chamelium_audio@hdmi-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-st=
ress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_content_protection@srm.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_cursor_crc@cursor-onscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs=
-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-=
vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_flip@plain-flip-interrup=
tible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard=
-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_plane_multiple@tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-433/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_rpm@dpms-m=
ode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_pm_=
rpm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_pm_rpm@drm-resou=
rces-equal.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_prop=
erties@connector-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_proper=
ties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +105 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-primary-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-2/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-435/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@kms_vrr@flip-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-2/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5596">Intel XE#5596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_configfs@survivability-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5249">Intel XE#5249</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@xe_configfs@survivability-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5249">Intel XE#5249</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-3/igt@xe_copy_basic@mem-copy-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@xe_eudebug@vma-ufence-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_eudebug_online@interrupt-=
other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@xe_evict@evict-small-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +9 ot=
her tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-433/igt@xe_exec_fault_mode@many-use=
rptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a=
>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-race=
-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-new-race-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-432/igt@xe_exec_system_allocator@pr=
ocess-many-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +99 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-8/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip<=
/li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sha=
rd-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4945">Intel XE#4945</a>) +532 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5531">Intel XE#5531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@xe_oa@non-privileged-map-oa=
-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-6/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +2 other tests=
 skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-dg2-463/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-1/igt@xe_query@multigpu-query-gt-l=
ist.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-lnl-4/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@core_set=
master@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@cor=
e_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@fbdev@pa=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@fbdev@pan.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@intel_hwmon@hwmon-write.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_add=
fb_basic@legacy-format.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-4/igt@kms_addfb_basic=
@legacy-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
754v3/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-151754v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151754v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1754v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-=
hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg=
-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/=
igt@kms_flip@flip-vs-panning@d-hdmi-a1.html">PASS</a> +16 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
754v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151754v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/igt@kms_hdr@static-to=
ggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sh=
ard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PA=
SS</a> +92 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html"=
>PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_=
pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-lnl-1/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-4=
64/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +4 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1517=
54v3/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-free-nome=
mset.html">PASS</a> +424 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_modul=
e_load@reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5679">Intel XE#5679</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-9/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp=
-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-adlp-2/igt@xe_pm@s=
3-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-adlp-8/igt@xe_pm@s3-d=
3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_addf=
b_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-=
5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151754v3/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt=
@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/s=
hard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bm=
g-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#60=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/=
shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sh=
ard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151754v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/=
igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-434/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-43=
4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-=
2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sha=
rd-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard=
-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-b=
mg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE=
#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51754v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cham=
elium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_chamelium=
_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-434/igt@kms_ch=
amelium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@km=
s_chamelium_edid@dp-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +13 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_dsc@=
dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/ig=
t@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sh=
ard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945=
">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms_fbcon_fbt=
@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151754v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-=
yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151754v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1517=
54v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3=
/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1517=
54v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@k=
ms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151754v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
1754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151754v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151754v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51754v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1517=
54v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151754v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754=
v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@kms=
_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms=
_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bm=
g-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2=
501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151754v3/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_pm_backlight@=
fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard=
-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-3/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
6">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shar=
d-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@kms_ps=
r2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shar=
d-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51754v3/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@kms_ps=
r@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/=
igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@kms_psr@=
psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_psr=
@psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_psr@=
psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_psr@p=
sr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@kms_ps=
r@psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434=
/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@k=
ms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bm=
g-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-b=
mg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1517=
54v3/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Int=
el XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@kms_vrr@=
max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@kms_vrr@max-min.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/495=
0">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@sr=
iov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_eudeb=
ug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-=
bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_eudebu=
g_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_eudebug_=
sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">In=
tel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151754v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many=
-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-6/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
754v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4945">Intel XE#4945</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-43=
4/igt@xe_exec_fault_mode@many-userptr-invalidate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-large-mmap-huge.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/s=
hard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
43">Intel XE#4943</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-4/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Inte=
l XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151754v3/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-e=
xecqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +25 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-fork-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-463/igt@xe_exe=
c_system_allocator@twice-malloc-fork-read.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard=
-dg2-434/igt@xe_exec_system_allocator@twice-malloc-fork-read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-lnl-7/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/=
shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-435/igt@xe_oa@=
mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_oa@mi-rpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-2/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-8/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-4/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_pm@d3=
cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pm@d3cold-m=
map-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-466/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-6/igt@xe_pm@s3-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-7/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-8/igt@xe_pxp@d=
isplay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_pxp@disp=
lay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_pxp@p=
xp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg=
-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#473=
3</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_query=
@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-1/igt@xe_quer=
y@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-3/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-dg2-433/igt@xe_que=
ry@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-dg2-434/igt@xe=
_query@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-2/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel X=
E#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151754v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-1/igt@xe_sriov=
_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-5/igt@xe=
_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796/shard-bmg-5/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-=
7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8478 -&gt; IGT_8479</li>
<li>Linux: xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796 -&gt; xe-pw-151=
754v3</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8479: 5fea7ca6493415ce108231b0ff29f02d293f9aa6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3489-e1805ad9a7175457902ae453ea67b76194e7d796: e1805ad9a7175457902ae45=
3ea67b76194e7d796<br />
  xe-pw-151754v3: 151754v3</p>

</body>
</html>

--===============8252638259650163568==--
