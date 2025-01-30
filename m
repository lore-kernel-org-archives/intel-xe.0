Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A1C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E973310E057;
	Thu, 30 Jan 2025 08:39:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3C10E057;
 Thu, 30 Jan 2025 08:39:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1719729421720367377=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_AS=5FSDP_to_fastset_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 08:39:17 -0000
Message-ID: <173822635755.2747968.3299253690077810821@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============1719729421720367377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add AS_SDP to fastset (rev3)
URL   : https://patchwork.freedesktop.org/series/137034/
State : failure

== Summary ==

CI Bug Log - changes from xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b_full -> xe-pw-137034v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137034v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137034v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137034v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in xe-pw-137034v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#2423])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getclient.html

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#2423])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@core_getstats.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][8] -> [FAIL][9] ([Intel XE#3440])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@core_getversion@all-cards.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#3249])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2134]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@fbdev@info.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2134])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@fbdev@read.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#3908]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#3908]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2136]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#1033])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2669]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +132 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][36] -> [ABORT][37] ([Intel XE#2625])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][38] ([Intel XE#2625])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#3278])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-bmg:          [PASS][48] -> [DMESG-WARN][49] ([Intel XE#877]) +1 other test dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-8/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#4172]) +16 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
    - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#4173])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#2953])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#309])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [PASS][61] -> [INCOMPLETE][62] ([Intel XE#3226] / [Intel XE#4172])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_cursor_legacy@forked-bo.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#3226])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2425])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2244])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1138])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#3321]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1421]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2423] / [i915#2575]) +64 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#2955])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401] / [Intel XE#1745])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#2136]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#656]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2351]) +18 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#651]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#653]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#656]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][89] ([Intel XE#4172])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2925])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#2423] / [i915#2575]) +50 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#616]) +2 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#455])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#2571])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2763]) +11 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2938])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2136]) +88 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#2446])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2446])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2446])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2423]) +19 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_properties@crtc-properties-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1127])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#899]) +2 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [FAIL][115] ([Intel XE#1522]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_vrr@flip-basic.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-adlp:         [PASS][116] -> [DMESG-WARN][117] ([Intel XE#3868])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#3889])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@vma-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2905]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2905])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#261] / [Intel XE#688])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1392])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#1392]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#288]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_threads@threads-fd-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][127] ([Intel XE#1033]) +2 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_exec_threads@threads-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#1130]) +43 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1130]) +122 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2229])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156]) -> ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [SKIP][181], [PASS][182]) ([Intel XE#378])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][183] ([Intel XE#3546])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#379])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@xe_noexec_ping_pong.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#979])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][186] -> [ABORT][187] ([Intel XE#1358] / [Intel XE#1794])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][188] ([Intel XE#1033] / [Intel XE#569])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][189] -> [ABORT][190] ([Intel XE#1358])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][191] -> [ABORT][192] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][193] -> [SKIP][194] ([Intel XE#1130]) +91 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#3249]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2134]) -> [PASS][198] +2 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@fbdev@write.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-bmg:          [DMESG-WARN][199] ([Intel XE#4172]) -> [PASS][200] +2 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_atomic@plane-cursor-legacy.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [PASS][202] +79 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][203] ([Intel XE#2136]) -> [PASS][204] +4 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][205] ([Intel XE#2291]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][207] ([Intel XE#2373]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][209] ([Intel XE#3321]) -> [PASS][210] +3 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][211] ([Intel XE#2423]) -> [PASS][212] +19 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][213] ([Intel XE#2316]) -> [PASS][214] +2 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][215] ([Intel XE#886]) -> [PASS][216] +3 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][217] ([Intel XE#2953]) -> [PASS][218] +3 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][219] ([Intel XE#4173]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [FAIL][221] ([Intel XE#2882]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][224] +8 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2136]) -> [PASS][226] +22 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-adlp:         [DMESG-WARN][227] -> [PASS][228] +2 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     [DMESG-WARN][229] ([Intel XE#1033]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2446]) -> [PASS][232] +3 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][233] ([Intel XE#2446]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1130]) -> [PASS][236] +140 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [ABORT][237] ([Intel XE#2625]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1392]) -> [PASS][240] +3 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][241] ([Intel XE#1192]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][243] ([Intel XE#1999]) -> [PASS][244] +2 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [SKIP][245] ([Intel XE#1130]) -> [PASS][246] +43 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][247] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][249] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][251] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2136]) -> [DMESG-WARN][254] ([Intel XE#1033]) +1 other test dmesg-warn
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#3768]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136]) -> [SKIP][258] ([Intel XE#2327]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#316]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#316]) -> [SKIP][262] ([Intel XE#2136])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1124]) -> [SKIP][264] ([Intel XE#2136]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][266] ([Intel XE#1124]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][267] ([Intel XE#2136]) -> [SKIP][268] ([Intel XE#1124]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][269] ([Intel XE#1124]) -> [SKIP][270] ([Intel XE#2136])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1124]) -> [SKIP][272] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#1124]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][275] ([Intel XE#607]) -> [SKIP][276] ([Intel XE#2136])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136]) -> [SKIP][278] ([Intel XE#607])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][279] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][280] ([Intel XE#2423])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#2191]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2191]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][285] ([Intel XE#2423]) -> [SKIP][286] ([Intel XE#367])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#367]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][290] ([Intel XE#2136]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][292] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][293] ([Intel XE#2887]) -> [SKIP][294] ([Intel XE#2136]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][295] ([Intel XE#1033]) -> [SKIP][296] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][298] ([Intel XE#455] / [Intel XE#787])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][299] ([Intel XE#3432]) -> [SKIP][300] ([Intel XE#2136])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136]) -> [SKIP][302] ([Intel XE#2907])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#2887]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][308] ([Intel XE#314])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-bmg:          [SKIP][309] ([Intel XE#2252]) -> [SKIP][310] ([Intel XE#2423]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-edid.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#306]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2423] / [i915#2575]) -> [SKIP][314] ([Intel XE#306])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][315] ([Intel XE#2423]) -> [SKIP][316] ([Intel XE#2252]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#373]) +11 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#373]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][321] ([Intel XE#2423]) -> [FAIL][322] ([Intel XE#1178])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@atomic.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][323] ([Intel XE#1178]) -> [SKIP][324] ([Intel XE#2341])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2423] / [i915#2575]) -> [SKIP][326] ([Intel XE#307])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [SKIP][328] ([Intel XE#2341])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][329] ([Intel XE#2341]) -> [SKIP][330] ([Intel XE#2423])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_content_protection@mei-interface.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#308]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([Intel XE#308])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          [SKIP][335] ([Intel XE#2320]) -> [SKIP][336] ([Intel XE#2423])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][337] ([Intel XE#2423]) -> [SKIP][338] ([Intel XE#2320])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][340] ([Intel XE#1033]) +1 other test dmesg-warn
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][341] ([Intel XE#877]) -> [SKIP][342] ([Intel XE#2291])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][343] ([Intel XE#1033]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][345] ([Intel XE#2423]) -> [SKIP][346] ([Intel XE#2286])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#455]) -> [SKIP][348] ([Intel XE#2136] / [Intel XE#2351])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][349] ([Intel XE#776]) -> [SKIP][350] ([Intel XE#2136])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#776])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2423] / [i915#2575]) -> [SKIP][354] ([Intel XE#703])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2423] / [i915#2575]) -> [SKIP][356] ([Intel XE#1137])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2423] / [i915#2575]) -> [FAIL][358] ([Intel XE#301])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][359] ([Intel XE#301]) -> [SKIP][360] ([Intel XE#2423] / [i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][362] ([Intel XE#455])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#455]) -> [SKIP][366] ([Intel XE#2136]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#651]) +14 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][369] ([Intel XE#2311]) -> [SKIP][370] ([Intel XE#2136]) +6 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][371] ([Intel XE#2311]) -> [SKIP][372] ([Intel XE#2312]) +6 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][374] ([Intel XE#651]) +9 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-bmg:          [SKIP][375] ([Intel XE#2136]) -> [SKIP][376] ([Intel XE#2311]) +7 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][377] ([Intel XE#1033]) -> [SKIP][378] ([Intel XE#2136]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][379] ([Intel XE#2312]) -> [SKIP][380] ([Intel XE#4141]) +5 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][381] ([Intel XE#2136]) -> [SKIP][382] ([Intel XE#4141]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][383] ([Intel XE#4141]) -> [SKIP][384] ([Intel XE#2312]) +4 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][386] ([Intel XE#658])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#651]) -> [SKIP][388] ([Intel XE#2136]) +8 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][389] ([Intel XE#2312]) -> [SKIP][390] ([Intel XE#2311]) +7 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#651]) -> [SKIP][392] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][394] ([Intel XE#653]) +3 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2313]) -> [SKIP][396] ([Intel XE#2312]) +7 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][397] ([Intel XE#2136]) -> [SKIP][398] ([Intel XE#2313]) +7 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][399] ([Intel XE#2313]) -> [SKIP][400] ([Intel XE#2136]) +5 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#653]) -> [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#658]) -> [SKIP][404] ([Intel XE#2136] / [Intel XE#2351])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][405] ([Intel XE#4141]) -> [SKIP][406] ([Intel XE#2136]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#455]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#653]) +21 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#653]) -> [SKIP][412] ([Intel XE#2136]) +16 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][413] ([Intel XE#2312]) -> [SKIP][414] ([Intel XE#2313]) +7 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#455]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][417] ([Intel XE#346]) -> [SKIP][418] ([Intel XE#2136])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136]) -> [SKIP][420] ([Intel XE#346])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][421] ([Intel XE#2486]) -> [SKIP][422] ([Intel XE#2423])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2423] / [i915#2575]) -> [FAIL][424] ([Intel XE#616])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_cursor@primary.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][425] -> [SKIP][426] ([Intel XE#2423] / [i915#2575])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][428] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][431] ([Intel XE#2446]) -> [SKIP][432] ([Intel XE#1439] / [Intel XE#836])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2446]) -> [DMESG-WARN][434] ([Intel XE#1033] / [Intel XE#2042])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][435] ([Intel XE#1489]) -> [SKIP][436] ([Intel XE#2136]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1489]) -> [SKIP][438] ([Intel XE#2136]) +7 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#1489])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#1489]) +6 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][443] ([Intel XE#2387]) -> [SKIP][444] ([Intel XE#2136])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#1122])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][450] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          [SKIP][451] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][452] ([Intel XE#2136]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][454] ([Intel XE#2136]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][456] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_psr@pr-sprite-plane-onoff.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2136]) -> [SKIP][458] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@psr2-basic.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][460] ([Intel XE#2939])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#3414]) -> [SKIP][462] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][463] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][464] ([Intel XE#2423])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2423] / [i915#2575]) -> [SKIP][466] ([Intel XE#1127])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2423] / [i915#2575]) -> [SKIP][468] ([Intel XE#3414]) +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][469] ([Intel XE#1729]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][471] ([Intel XE#2168]) -> [SKIP][472] ([Intel XE#2423])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_vrr@cmrr.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2423] / [i915#2575]) -> [SKIP][474] ([Intel XE#2168])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@cmrr.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#455]) +5 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@flipline.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][477] ([Intel XE#2423]) -> [SKIP][478] ([Intel XE#2168])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_vrr@lobf.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#756]) -> [SKIP][480] ([Intel XE#2423] / [i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2423] / [i915#2575]) -> [SKIP][482] ([Intel XE#756])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2423] / [i915#2575]) -> [SKIP][484] ([Intel XE#1091] / [Intel XE#2849])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][486] ([Intel XE#1130])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1123]) -> [SKIP][488] ([Intel XE#1130]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130]) -> [SKIP][490] ([Intel XE#1126])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#2905]) +12 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_eudebug@basic-close.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][493] ([Intel XE#1130]) -> [SKIP][494] ([Intel XE#2905]) +2 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][495] ([Intel XE#2905]) -> [SKIP][496] ([Intel XE#1130]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2905]) -> [SKIP][498] ([Intel XE#1130]) +4 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][499] ([Intel XE#2322]) -> [SKIP][500] ([Intel XE#1130]) +2 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1392]) -> [SKIP][502] ([Intel XE#1130]) +2 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1130]) -> [SKIP][504] ([Intel XE#1392])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][505] ([Intel XE#1130]) -> [SKIP][506] ([Intel XE#2322]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#288]) -> [SKIP][508] ([Intel XE#1130]) +13 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1130]) -> [SKIP][510] ([Intel XE#288]) +24 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#2360]) -> [SKIP][512] ([Intel XE#1130])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1130]) -> [SKIP][514] ([Intel XE#255])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [DMESG-WARN][516] ([Intel XE#1033])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_mmap@pci-membarrier-parallel.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1130]) -> [SKIP][518] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][520] ([Intel XE#1130]) +4 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][521] ([Intel XE#1173]) -> [SKIP][522] ([Intel XE#1061])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_peer2peer@read.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
    - shard-bmg:          [SKIP][525] ([Intel XE#2284]) -> [SKIP][526] ([Intel XE#1130])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_pm@d3cold-basic-exec.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][528] ([Intel XE#1130]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [ABORT][529] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][530] ([Intel XE#1130]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_pm@s2idle-basic.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1130]) -> [ABORT][532] ([Intel XE#1358] / [Intel XE#1794])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@s2idle-mocs.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-dg2-set2:     [DMESG-WARN][533] ([Intel XE#1033]) -> [SKIP][534] ([Intel XE#1130])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_pm_residency@toggle-gt-c6.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          [SKIP][535] ([Intel XE#1130]) -> [SKIP][536] ([Intel XE#944])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_query@multigpu-query-topology.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130]) -> [SKIP][538] ([Intel XE#944]) +3 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-bmg:          [SKIP][539] ([Intel XE#944]) -> [SKIP][540] ([Intel XE#1130])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1130]) -> [SKIP][542] ([Intel XE#3342])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1130]) -> [ABORT][544] ([Intel XE#3075] / [Intel XE#3084])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -> xe-pw-137034v3

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b
  xe-pw-137034v3: 137034v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/index.html

--===============1719729421720367377==
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
<tr><td><b>Series:</b></td><td>Add AS_SDP to fastset (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137034/">https://patchwork.freedesktop.org/series/137034/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137034v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137034v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2572-c2a5da40b8b1c5af77dcdabed85160699=
49fea3b_full -&gt; xe-pw-137034v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137034v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137034v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1370=
34v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@core_h=
otunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@core_hotunplug=
@hotrebind-lateclose.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_pm_=
rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_pm_rpm@modeset-l=
psp-stress.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137034v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getclient.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@core_g=
etstats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getstats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@fbdev@=
info.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137034v3/shard-dg2-433/igt@fbdev@info.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@fbdev@read.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel =
XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-9/igt@=
kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adl=
p-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/ig=
t@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#=
3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_=
fb@x-tiled-addfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE=
#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_chamelium_audio@dp-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_chamelium_color@ctm-max=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_curs=
or_crc@cursor-alpha-opaque.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-8/igt@kms_cursor_crc@cur=
sor-alpha-opaque.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_cursor_crc@cursor-rando=
m-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-8/igt@kms_cursor_crc@cursor-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4172">Intel XE#4172</a>) +16 other tests dmesg-warn</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_cursor_crc@cursor=
-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-6/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_curs=
or_legacy@forked-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_cursor_legacy@forked-=
bo.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3226">Intel XE#3226</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_curs=
or_legacy@forked-bo@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_cursor_legacy@=
forked-bo@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_flip=
@2x-blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/ig=
t@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-5/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired=
-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-rec=
reate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_flip@blocking-wf_vblank=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137034v3/shard-bmg-2/igt@kms_flip@flip-vs-suspend.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@=
kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@kms_hdr@static-toggle-suspend=
@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_pi=
pe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@k=
ms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_plane_multiple@tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_pm_r=
pm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_pm_rpm@basic-pci-d3=
-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_rpm@legacy-planes.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_prop=
erties@crtc-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_properties@=
crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +19 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-3/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@kms_vrr@flip-basic.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">=
Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_drm_=
fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-=
3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
68">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_eudebug@vma-ufence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_eudebug_online@interrupt=
-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_evict@evict-beng-small-ext=
ernal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-=
432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_exec_fault_mode@many-bin=
dexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_exec_threads@threads-fd-=
userptr-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sha=
rd-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_fault_injection@vm-creat=
e-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +122 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed851606994=
9fea3b/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed851=
6069949fea3b/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcd=
abed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5a=
f77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b=
8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a=
5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
72-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949f=
ea3b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed85160=
69949fea3b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabe=
d8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77=
dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1=
c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da=
40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-=
c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
37034v3/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-137034v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-=
434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137034v3/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/=
shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2=
-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137034v3/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_module_load@many-reload.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-adlp-2/igt@xe_noexec_ping_pong.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"=
>Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_pm@=
s3-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s3-multiple-execs.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_pm@=
s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-1/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137034v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_vm@=
munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +91 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt=
@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@fbdev@=
write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@fbdev@write.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_atom=
ic@plane-cursor-legacy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-1/igt@km=
s_atomic@plane-cursor-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_at=
omic@plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +79 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-b=
mg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +4 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-b=
mg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137034v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-7/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adl=
p-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adlp-4/=
igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_fl=
ip@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms=
_flip@plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-upscaling.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7034v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb=
-draw-blt.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-adl=
p-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_pl=
ane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-fac=
tor-0-25-with-pixel-format@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm=
_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_pm_rpm@c=
ursor-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_r=
pm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_pm_rpm@=
universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_ccs=
@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_cc=
s@ctrl-surf-copy-new-ctx.html">PASS</a> +140 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_ccs=
@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel X=
E#2625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137034v3/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfm=
t0-vram01-vram01.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7034v3/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userp=
tr-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-4/igt@xe_live_ktest@=
xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-b=
mg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> +43 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_p=
m@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-lnl-4/igt@xe_pm@s4-m=
ocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_h=
otunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@=
core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
33/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@=
kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_bi=
g_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms=
_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@=
kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sha=
rd-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_=
fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_bi=
g_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3=
/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-=
3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-=
dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel X=
E#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-137034v3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-137034v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@l=
inear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/=
igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034=
v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_cc=
s@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13703=
4v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_ccs@=
ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bm=
g-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3=
/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bm=
g-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-=
463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-b=
mg-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE=
#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#31=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_cham=
elium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_c=
hamelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ch=
amelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@=
kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ch=
amelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sha=
rd-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cham=
elium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/ig=
t@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ch=
amelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
33/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v=
3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel=
 XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/=
shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_curs=
or_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3=
/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2=
-463/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +=
1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg=
-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cu=
rsor_legacy@flip-vs-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/=
shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_dir=
tyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_fbcon_fbt@psr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-=
dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-=
463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shar=
d-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_f=
lip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137034v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-137034v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/=
shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard=
-bmg-7/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Inte=
l XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v=
3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#65=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-137034v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
7034v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137034v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
034v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sha=
rd-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@k=
ms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other =
tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/=
igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137034v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034=
v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_hdr@invalid-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_joiner@ba=
sic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/=
igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_pl=
ane_scaling@intel-max-src-size.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-=
factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm=
_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@k=
ms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#204=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shar=
d-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
33/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
034v3/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-ex=
ceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3=
/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_psr@fbc-p=
r-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shar=
d-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_psr@=
fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/i=
gt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2=
-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ps=
r@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
33/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@kms_psr@psr2-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137034v3/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@kms_rot=
ation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shar=
d-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
37034v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/sh=
ard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-137034v3/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_eud=
ebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target=
-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-137034v3/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137034v3/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1370=
34v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
37034v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2=
-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/s=
hard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_huc_copy@hu=
c_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_mma=
p@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-463/igt@xe_=
mmap@pci-membarrier-parallel.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_oa@=
closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt=
@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/=
igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-466/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</l=
i>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_pm@d3=
cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/igt@xe_pm@d3cold-ba=
sic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_pm@=
d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433=
/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_pm@=
s2idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@x=
e_pm@s2idle-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@=
s2idle-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-432/igt@xe_pm@s2idle-mocs=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_pm_=
residency@toggle-gt-c6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-433/igt@=
xe_pm_residency@toggle-gt-c6.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_query=
@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-7/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-4=
66/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +3 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@xe_query=
@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-bmg-3/ig=
t@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_wed=
ged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137034v3/shard-dg2-434/igt@xe_wed=
ged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -&gt; xe-pw-137=
034v3</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdab=
ed8516069949fea3b<br />
  xe-pw-137034v3: 137034v3</p>

</body>
</html>

--===============1719729421720367377==--
