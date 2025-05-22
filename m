Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8937C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 07:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5028814A919;
	Thu, 22 May 2025 07:44:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0AA10FAEB;
 Thu, 22 May 2025 07:44:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2096115303118368837=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dp=3A_Fix_the_ena?=
 =?utf-8?q?bling/disabling_of_audio_SDP_splitting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 07:44:52 -0000
Message-ID: <174789989268.12496.15046066155577945520@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142219.1688401-1-imre.deak@intel.com>
In-Reply-To: <20250520142219.1688401-1-imre.deak@intel.com>
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

--===============2096115303118368837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix the enabling/disabling of audio SDP splitting (rev2)
URL   : https://patchwork.freedesktop.org/series/149254/
State : failure

== Summary ==

CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b_FULL -> xe-pw-149254v2_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-149254v2_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149254v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149254v2_FULL:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     ([SKIP][1], [SKIP][2]) ([Intel XE#4208]) -> ([DMESG-WARN][3], [SKIP][4]) ([Intel XE#4208])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-149254v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         ([PASS][5], [PASS][6]) -> ([PASS][7], [SKIP][8]) ([Intel XE#4963])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][9], [SKIP][10]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][11], [SKIP][12]) ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +216 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#455] / [Intel XE#787])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][19], [INCOMPLETE][20]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][21] -> ([INCOMPLETE][22], [PASS][23], [PASS][24]) ([Intel XE#3124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> ([PASS][26], [DMESG-WARN][27], [PASS][28]) ([Intel XE#1727] / [Intel XE#3113])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][29] -> ([PASS][30], [INCOMPLETE][31]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#4417]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][33], [SKIP][34]) ([Intel XE#373])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#373]) +1 other test ( 2 skip )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-adlp:         ([PASS][37], [PASS][38]) -> ([SKIP][39], [PASS][40]) ([Intel XE#4950] / [Intel XE#4996]) +3 other tests ( 1 pass, 1 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_color@invalid-ctm-matrix-sizes.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_color@invalid-ctm-matrix-sizes.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_color@invalid-ctm-matrix-sizes.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1188])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-adlp:         ([PASS][43], [PASS][44]) -> ([PASS][45], [DMESG-WARN][46], [PASS][47]) ([Intel XE#4173])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cursor_crc@cursor-dpms.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_cursor_crc@cursor-dpms.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_cursor_crc@cursor-dpms.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_cursor_crc@cursor-dpms.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          ([PASS][48], [PASS][49]) -> ([PASS][50], [SKIP][51], [PASS][52]) ([Intel XE#2291]) +2 other tests ( 2 pass, 1 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          ([PASS][53], [PASS][54]) -> ([SKIP][55], [PASS][56]) ([Intel XE#2291])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][57] -> ([PASS][58], [PASS][59], [SKIP][60]) ([Intel XE#2291])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          ([PASS][61], [PASS][62]) -> ([PASS][63], [FAIL][64]) ([Intel XE#1475])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          ([PASS][65], [PASS][66]) -> ([PASS][67], [SKIP][68]) ([Intel XE#3009])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_dp_aux_dev.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_aux_dev.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_dp_aux_dev.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          ([PASS][69], [PASS][70]) -> ([PASS][71], [SKIP][72]) ([Intel XE#2373])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          ([PASS][73], [PASS][74]) -> ([PASS][75], [SKIP][76]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     ([PASS][77], [PASS][78]) -> ([FAIL][79], [PASS][80]) ([Intel XE#301] / [Intel XE#3321])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          ([PASS][81], [PASS][82]) -> [FAIL][83] ([Intel XE#3321]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          ([PASS][84], [PASS][85]) -> ([PASS][86], [PASS][87], [SKIP][88]) ([Intel XE#2316]) +12 other tests ( 2 pass, 1 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> ([PASS][89], [FAIL][90]) ([Intel XE#301])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#301]) +8 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         ([PASS][92], [PASS][93]) -> ([PASS][94], [DMESG-WARN][95]) ([Intel XE#2953] / [Intel XE#4173]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [PASS][96] -> ([FAIL][97], [PASS][98], [PASS][99]) ([Intel XE#886])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#455]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-adlp:         ([PASS][101], [PASS][102]) -> ([SKIP][103], [PASS][104]) ([Intel XE#4996]) +1 other test ( 1 pass, 1 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#651]) +3 other tests ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#656]) +3 other tests ( 2 skip )
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         ([PASS][109], [PASS][110]) -> ([PASS][111], [PASS][112], [DMESG-WARN][113]) ([Intel XE#2953] / [Intel XE#4173])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#653])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          ([PASS][118], [PASS][119]) -> ([PASS][120], [PASS][121], [SKIP][122]) ([Intel XE#1503]) +1 other test ( 2 pass, 1 skip )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_hdr@static-toggle.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_hdr@static-toggle.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_hdr@static-toggle.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][123] -> ([DMESG-WARN][124], [PASS][125]) ([Intel XE#4173]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          ([PASS][126], [PASS][127]) -> ([SKIP][128], [PASS][129]) ([Intel XE#3012])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#2927])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         ([PASS][132], [PASS][133]) -> ([PASS][134], [DMESG-WARN][135]) ([Intel XE#4173]) +5 other tests ( 1 dmesg-warn, 1 pass )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#2763]) +3 other tests ( 2 skip )
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-adlp:         ([PASS][142], [PASS][143]) -> [DMESG-WARN][144] ([Intel XE#4173])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][145], [SKIP][146]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][147], [SKIP][148]) ([Intel XE#2850] / [Intel XE#929]) +1 other test ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_psr@fbc-psr-primary-blt.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#455])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_vrr@seamless-rr-switch-drrs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_create@invalid-pad:
    - shard-adlp:         [PASS][151] -> ([PASS][152], [DMESG-WARN][153], [PASS][154]) ([Intel XE#4173])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_create@invalid-pad.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_create@invalid-pad.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_create@invalid-pad.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_create@invalid-pad.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#4837])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     ([PASS][157], [PASS][158]) -> ([PASS][159], [SKIP][160]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     ([PASS][161], [PASS][162]) -> ([SKIP][163], [PASS][164], [PASS][165]) ([Intel XE#1392]) +12 other tests ( 2 pass, 1 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][166], [PASS][167]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#288])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][169], [SKIP][170]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([Intel XE#4943])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#4915]) +35 other tests ( 2 skip )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_system_allocator@many-mmap-huge.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_system_allocator@many-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4915]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][176], [SKIP][177]) ([Intel XE#2541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          ([PASS][178], [PASS][179]) -> ([PASS][180], [ABORT][181], [PASS][182]) ([Intel XE#1794]) +2 other tests ( 1 abort, 2 pass )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [PASS][183] -> ([PASS][184], [ABORT][185], [PASS][186]) ([Intel XE#1794])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         ([PASS][187], [PASS][188]) -> ([PASS][189], [PASS][190], [ABORT][191]) ([Intel XE#1794])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [PASS][192] -> ([PASS][193], [ABORT][194]) ([Intel XE#1794])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         ([PASS][195], [PASS][196]) -> ([PASS][197], [ABORT][198]) ([Intel XE#1794])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#944])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-adlp:         ([PASS][201], [PASS][202]) -> ([PASS][203], [SKIP][204]) ([Intel XE#4945]) +9 other tests ( 1 pass, 1 skip )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_vm@munmap-style-unbind-one-partial.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         ([DMESG-FAIL][205], [PASS][206]) ([Intel XE#4543]) -> [PASS][207]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][208] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][209], [PASS][210])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     ([INCOMPLETE][211], [PASS][212]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][213], [PASS][214])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     ([PASS][215], [INCOMPLETE][216]) ([Intel XE#3124]) -> ([PASS][217], [PASS][218], [PASS][219])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     ([DMESG-WARN][220], [PASS][221]) ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][222], [PASS][223], [PASS][224])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          ([SKIP][225], [PASS][226]) ([Intel XE#2291]) -> ([PASS][227], [PASS][228]) +1 other test ( 2 pass )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          ([PASS][229], [SKIP][230]) ([Intel XE#2291]) -> [PASS][231]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          ([SKIP][232], [PASS][233]) ([Intel XE#4294]) -> [PASS][234]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          ([FAIL][235], [PASS][236]) ([Intel XE#3321]) -> [PASS][237]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     ([FAIL][238], [PASS][239]) ([Intel XE#301]) -> ([PASS][240], [PASS][241])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          ([SKIP][242], [PASS][243]) ([Intel XE#2316]) -> [PASS][244] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          ([SKIP][245], [PASS][246]) ([Intel XE#2316]) -> ([PASS][247], [PASS][248]) +1 other test ( 2 pass )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     ([PASS][249], [FAIL][250]) ([Intel XE#3549]) -> ([PASS][251], [PASS][252], [PASS][253])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:
    - shard-dg2-set2:     ([PASS][254], [FAIL][255]) ([Intel XE#3549]) -> ([PASS][256], [PASS][257]) +3 other tests ( 2 pass )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         ([DMESG-WARN][258], [DMESG-WARN][259]) ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][260], [PASS][261]) +1 other test ( 2 pass )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         ([DMESG-WARN][262], [PASS][263]) ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][264], [PASS][265])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          ([FAIL][266], [FAIL][267]) ([Intel XE#2882]) -> ([PASS][268], [PASS][269])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp2:
    - shard-bmg:          [FAIL][270] ([Intel XE#2882]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-dp2.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
    - shard-bmg:          ([FAIL][272], [PASS][273]) ([Intel XE#2882]) -> ([PASS][274], [PASS][275])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][276] ([Intel XE#1503]) -> ([PASS][277], [PASS][278])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     ([PASS][279], [SKIP][280]) ([Intel XE#1392]) -> ([PASS][281], [PASS][282]) +8 other tests ( 2 pass )
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe_exec_basic@multigpu-once-rebind.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          ([PASS][283], [ABORT][284]) ([Intel XE#5087]) -> ([PASS][285], [PASS][286], [PASS][287])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_module_load@reload-no-display.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@xe_module_load@reload-no-display.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          ([ABORT][288], [PASS][289]) ([Intel XE#1794]) -> ([PASS][290], [PASS][291], [PASS][292])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         ([PASS][293], [ABORT][294]) ([Intel XE#1794]) -> ([PASS][295], [PASS][296])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         ([DMESG-WARN][297], [PASS][298]) ([Intel XE#4173]) -> [DMESG-WARN][299] ([Intel XE#4173])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     ([SKIP][300], [SKIP][301]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][302], [SKIP][303]) ([Intel XE#1124] / [Intel XE#2351] / [Intel XE#4208])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
    - shard-adlp:         ([SKIP][304], [SKIP][305]) ([Intel XE#1124]) -> ([SKIP][306], [SKIP][307]) ([Intel XE#1124] / [Intel XE#4996])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][308] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][309], [PASS][310], [PASS][311]) ([Intel XE#2314] / [Intel XE#2894])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         ([SKIP][312], [SKIP][313]) ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][314], [SKIP][315]) ([Intel XE#2351] / [Intel XE#455] / [Intel XE#4996] / [Intel XE#787])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     ([SKIP][316], [SKIP][317]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][318], [SKIP][319]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#455] / [Intel XE#787])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-adlp:         ([SKIP][320], [SKIP][321]) ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][322], [SKIP][323]) ([Intel XE#455] / [Intel XE#4996] / [Intel XE#787])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
    - shard-dg2-set2:     ([SKIP][324], [SKIP][325]) ([Intel XE#4208]) -> ([SKIP][326], [SKIP][327]) ([Intel XE#4208] / [Intel XE#455] / [Intel XE#787])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     ([INCOMPLETE][328], [PASS][329]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> ([INCOMPLETE][330], [PASS][331]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     ([PASS][332], [INCOMPLETE][333]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> ([INCOMPLETE][334], [PASS][335], [INCOMPLETE][336]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     ([INCOMPLETE][337], [INCOMPLETE][338]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4212]) -> ([INCOMPLETE][339], [PASS][340], [PASS][341]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][342] ([Intel XE#2705] / [Intel XE#4212]) -> ([INCOMPLETE][343], [PASS][344]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          ([FAIL][345], [FAIL][346]) ([Intel XE#1178]) -> ([FAIL][347], [SKIP][348], [FAIL][349]) ([Intel XE#1178] / [Intel XE#2341])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          ([FAIL][350], [SKIP][351]) ([Intel XE#1178] / [Intel XE#2341]) -> ([FAIL][352], [FAIL][353]) ([Intel XE#1178])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_content_protection@srm.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_content_protection@srm.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_protection@srm.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          ([FAIL][354], [FAIL][355]) ([Intel XE#1188]) -> ([SKIP][356], [FAIL][357]) ([Intel XE#1188] / [Intel XE#2341])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_content_protection@uevent.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_content_protection@uevent.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_content_protection@uevent.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-dg2-set2:     ([SKIP][358], [SKIP][359]) ([Intel XE#4208] / [i915#2575]) -> ([SKIP][360], [PASS][361]) ([Intel XE#4208] / [i915#2575]) +6 other tests ( 1 pass, 1 skip )
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         ([SKIP][362], [SKIP][363]) ([Intel XE#309]) -> ([SKIP][364], [SKIP][365]) ([Intel XE#309] / [Intel XE#4996]) +1 other test ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][366] ([Intel XE#2291]) -> ([PASS][367], [SKIP][368], [PASS][369]) ([Intel XE#2291]) +2 other tests ( 2 pass, 1 skip )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][370] ([Intel XE#2291]) -> ([SKIP][371], [PASS][372]) ([Intel XE#2291])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-adlp:         ([SKIP][373], [SKIP][374]) ([Intel XE#455]) -> ([SKIP][375], [SKIP][376]) ([Intel XE#455] / [Intel XE#4996]) +1 other test ( 2 skip )
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2-set2:     ([SKIP][377], [SKIP][378]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][379], [SKIP][380]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#455])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-adlp:         ([SKIP][381], [SKIP][382]) ([Intel XE#310]) -> ([SKIP][383], [SKIP][384]) ([Intel XE#310] / [Intel XE#4996])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          ([FAIL][385], [FAIL][386]) ([Intel XE#3321]) -> ([SKIP][387], [FAIL][388]) ([Intel XE#2316] / [Intel XE#3321])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     ([FAIL][389], [FAIL][390]) ([Intel XE#301]) -> ([FAIL][391], [PASS][392]) ([Intel XE#301])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     ([FAIL][393], [FAIL][394]) ([Intel XE#301] / [Intel XE#3321]) -> ([FAIL][395], [PASS][396]) ([Intel XE#301] / [Intel XE#3321])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][397] ([Intel XE#2316]) -> ([PASS][398], [PASS][399], [SKIP][400]) ([Intel XE#2316])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][401] ([Intel XE#886]) -> ([PASS][402], [PASS][403], [FAIL][404]) ([Intel XE#886]) +1 other test ( 1 fail, 2 pass )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-dg2-set2:     ([SKIP][405], [SKIP][406]) ([Intel XE#2351] / [Intel XE#4208]) -> ([PASS][407], [SKIP][408]) ([Intel XE#2351] / [Intel XE#4208])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          ([SKIP][409], [SKIP][410]) ([Intel XE#2311]) -> ([SKIP][411], [SKIP][412], [SKIP][413]) ([Intel XE#2311] / [Intel XE#2312]) +20 other tests ( 3 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         ([SKIP][414], [SKIP][415]) ([Intel XE#656]) -> ([SKIP][416], [SKIP][417]) ([Intel XE#4947] / [Intel XE#656])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     ([SKIP][418], [SKIP][419]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][420], [SKIP][421]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#651])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][422] ([Intel XE#2312]) -> ([SKIP][423], [SKIP][424], [SKIP][425]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 3 skip )
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-adlp:         ([SKIP][426], [SKIP][427]) ([Intel XE#656]) -> ([SKIP][428], [SKIP][429]) ([Intel XE#4996] / [Intel XE#656]) +1 other test ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
    - shard-dg2-set2:     ([SKIP][430], [SKIP][431]) ([Intel XE#4208]) -> ([SKIP][432], [SKIP][433]) ([Intel XE#4208] / [Intel XE#651]) +1 other test ( 2 skip )
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         ([DMESG-FAIL][434], [DMESG-FAIL][435]) ([Intel XE#4543]) -> ([DMESG-FAIL][436], [DMESG-FAIL][437]) ([Intel XE#4173] / [Intel XE#4543])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          ([SKIP][438], [SKIP][439]) ([Intel XE#2312] / [Intel XE#4141]) -> ([SKIP][440], [SKIP][441]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][442] ([Intel XE#2312]) -> ([SKIP][443], [SKIP][444], [SKIP][445]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 3 skip )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][446] ([Intel XE#2312]) -> ([SKIP][447], [SKIP][448]) ([Intel XE#2312] / [Intel XE#4141])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][449], [SKIP][450]) ([Intel XE#4141]) -> ([SKIP][451], [SKIP][452], [SKIP][453]) ([Intel XE#2312] / [Intel XE#4141]) +10 other tests ( 3 skip )
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][454] ([Intel XE#4141]) -> ([SKIP][455], [SKIP][456], [SKIP][457]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 3 skip )
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][458], [SKIP][459]) ([Intel XE#4141]) -> ([SKIP][460], [SKIP][461]) ([Intel XE#2312] / [Intel XE#4141]) +2 other tests ( 2 skip )
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          ([SKIP][462], [SKIP][463]) ([Intel XE#2311] / [Intel XE#2312]) -> [SKIP][464] ([Intel XE#2311]) +3 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          ([SKIP][465], [SKIP][466]) ([Intel XE#2311] / [Intel XE#2312]) -> ([SKIP][467], [SKIP][468]) ([Intel XE#2311]) +5 other tests ( 2 skip )
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][469] ([Intel XE#2312]) -> ([SKIP][470], [SKIP][471]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][472], [SKIP][473]) ([Intel XE#2311]) -> ([SKIP][474], [SKIP][475]) ([Intel XE#2311] / [Intel XE#2312]) +7 other tests ( 2 skip )
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][476] ([Intel XE#2311]) -> ([SKIP][477], [SKIP][478], [SKIP][479]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 3 skip )
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-adlp:         ([SKIP][480], [SKIP][481]) ([Intel XE#651]) -> ([SKIP][482], [SKIP][483]) ([Intel XE#4947] / [Intel XE#651])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     ([SKIP][484], [SKIP][485]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][486], [SKIP][487]) ([Intel XE#2351] / [Intel XE#4208] / [Intel XE#658])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-adlp:         ([SKIP][488], [SKIP][489]) ([Intel XE#651]) -> ([SKIP][490], [SKIP][491]) ([Intel XE#4996] / [Intel XE#651])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         ([SKIP][492], [SKIP][493]) ([Intel XE#653]) -> ([SKIP][494], [SKIP][495]) ([Intel XE#4947] / [Intel XE#653])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
    - shard-dg2-set2:     ([SKIP][496], [SKIP][497]) ([Intel XE#4208]) -> ([SKIP][498], [SKIP][499]) ([Intel XE#4208] / [Intel XE#653])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          ([SKIP][500], [SKIP][501]) ([Intel XE#2312] / [Intel XE#2313]) -> [SKIP][502] ([Intel XE#2313]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][503] ([Intel XE#2313]) -> ([SKIP][504], [SKIP][505], [SKIP][506]) ([Intel XE#2312] / [Intel XE#2313]) +4 other tests ( 3 skip )
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          ([SKIP][507], [SKIP][508]) ([Intel XE#2312] / [Intel XE#2313]) -> ([SKIP][509], [SKIP][510]) ([Intel XE#2313]) +4 other tests ( 2 skip )
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          ([SKIP][511], [SKIP][512]) ([Intel XE#2313]) -> ([SKIP][513], [SKIP][514], [SKIP][515]) ([Intel XE#2312] / [Intel XE#2313]) +24 other tests ( 3 skip )
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          ([SKIP][516], [SKIP][517]) ([Intel XE#2313]) -> ([SKIP][518], [SKIP][519]) ([Intel XE#2312] / [Intel XE#2313]) +8 other tests ( 2 skip )
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][520] ([Intel XE#2312]) -> ([SKIP][521], [SKIP][522]) ([Intel XE#2312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][523] ([Intel XE#2312]) -> ([SKIP][524], [SKIP][525], [SKIP][526]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 3 skip )
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     ([SKIP][527], [SKIP][528]) ([Intel XE#4208] / [i915#2575]) -> ([SKIP][529], [SKIP][530]) ([Intel XE#4208] / [Intel XE#455] / [i915#2575]) +1 other test ( 2 skip )
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_plane_lowres@tiling-y.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          ([SKIP][531], [SKIP][532]) ([Intel XE#5021]) -> ([SKIP][533], [SKIP][534], [SKIP][535]) ([Intel XE#4596] / [Intel XE#5021])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][536] ([Intel XE#4596]) -> ([SKIP][537], [SKIP][538]) ([Intel XE#4596] / [Intel XE#5021])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-adlp:         ([SKIP][539], [SKIP][540]) ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][541], [SKIP][542]) ([Intel XE#2351] / [Intel XE#2850] / [Intel XE#929])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@pr-sprite-render.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_psr@pr-sprite-render.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_psr@pr-sprite-render.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     ([SKIP][543], [SKIP][544]) ([Intel XE#2351] / [Intel XE#4208]) -> ([SKIP][545], [SKIP][546]) ([Intel XE#2351] / [Intel XE#2850] / [Intel XE#4208] / [Intel XE#929]) +1 other test ( 2 skip )
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_psr@psr-sprite-blt.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_psr@psr-sprite-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_psr@psr-sprite-blt.html
    - shard-adlp:         ([SKIP][547], [SKIP][548]) ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][549], [SKIP][550]) ([Intel XE#2850] / [Intel XE#4996] / [Intel XE#929])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_psr@psr-sprite-blt.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_psr@psr-sprite-blt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         ([SKIP][551], [SKIP][552]) ([Intel XE#362]) -> ([SKIP][553], [SKIP][554]) ([Intel XE#362] / [Intel XE#4996])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     ([SKIP][555], [SKIP][556]) ([Intel XE#4208] / [i915#2575]) -> ([SKIP][557], [FAIL][558]) ([Intel XE#1729] / [Intel XE#4208] / [i915#2575])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         ([SKIP][559], [SKIP][560]) ([Intel XE#1062]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#1062] / [Intel XE#4945])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_create@create-big-vram.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_create@create-big-vram.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_create@create-big-vram.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         ([SKIP][563], [SKIP][564]) ([Intel XE#4837]) -> ([SKIP][565], [SKIP][566]) ([Intel XE#4837] / [Intel XE#4945])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_eudebug@discovery-empty.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_eudebug@discovery-empty.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_eudebug@discovery-empty.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_eudebug@discovery-empty.html
    - shard-dg2-set2:     ([SKIP][567], [SKIP][568]) ([Intel XE#4208]) -> ([SKIP][569], [SKIP][570]) ([Intel XE#4208] / [Intel XE#4837])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_eudebug@discovery-empty.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_eudebug@discovery-empty.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_eudebug@discovery-empty.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_compute_mode@once-userptr-free:
    - shard-dg2-set2:     ([SKIP][571], [SKIP][572]) ([Intel XE#4208]) -> ([PASS][573], [SKIP][574]) ([Intel XE#4208]) +10 other tests ( 1 pass, 1 skip )
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-free.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_exec_compute_mode@once-userptr-free.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-free.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_exec_compute_mode@once-userptr-free.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
    - shard-dg2-set2:     ([SKIP][575], [SKIP][576]) ([Intel XE#4208]) -> ([SKIP][577], [SKIP][578]) ([Intel XE#4208] / [Intel XE#4915]) +18 other tests ( 2 skip )
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
    - shard-adlp:         ([SKIP][579], [SKIP][580]) ([Intel XE#4915]) -> ([SKIP][581], [SKIP][582]) ([Intel XE#4915] / [Intel XE#4945] / [Intel XE#4996]) +18 other tests ( 2 skip )
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         ([TIMEOUT][583], [INCOMPLETE][584]) ([Intel XE#4911]) -> ([TIMEOUT][585], [TIMEOUT][586]) ([Intel XE#4911])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-adlp:         ([SKIP][587], [SKIP][588]) ([Intel XE#2541] / [Intel XE#3573]) -> ([SKIP][589], [SKIP][590]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4945])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_oa@invalid-oa-exponent.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_oa@invalid-oa-exponent.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.html
    - shard-dg2-set2:     ([SKIP][591], [SKIP][592]) ([Intel XE#4208]) -> ([SKIP][593], [SKIP][594]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4208])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_oa@invalid-oa-exponent.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][595] ([Intel XE#1794]) -> ([PASS][596], [ABORT][597], [PASS][598]) ([Intel XE#1794])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-adlp:         ([SKIP][599], [SKIP][600]) ([Intel XE#4733]) -> ([SKIP][601], [SKIP][602]) ([Intel XE#4733] / [Intel XE#4945])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
    - shard-dg2-set2:     ([SKIP][603], [SKIP][604]) ([Intel XE#4208]) -> ([SKIP][605], [SKIP][606]) ([Intel XE#4208] / [Intel XE#4733])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     ([SKIP][607], [SKIP][608]) ([Intel XE#4208]) -> ([SKIP][609], [SKIP][610]) ([Intel XE#4208] / [Intel XE#4273])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_sriov_flr@flr-twice.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html

  
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3549]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3549
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -> xe-pw-149254v2

  IGT_8371: 8371
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331ca1180a9dd2b5560b
  xe-pw-149254v2: 149254v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/index.html

--===============2096115303118368837==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix the enabling/disabling of a=
udio SDP splitting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149254/">https://patchwork.freedesktop.org/series/149254/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3119-3695d568b260d85e65f9331ca1180a9dd=
2b5560b_FULL -&gt; xe-pw-149254v2_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-149254v2_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149254v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1492=
54v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@core_=
hotunplug@unbind-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg=
2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
dg2-434/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@c=
ore_hotunplug@unbind-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149254v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@core_h=
otunplug@unbind-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adl=
p-4/igt@core_hotunplug@unbind-rebind.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@core_=
hotunplug@unbind-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@core_hotunplug@unbind-reb=
ind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-dis=
plays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays=
-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +216 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-=
4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-4=
33/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPL=
ETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-=
c-dp-4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-d=
g2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14925=
4v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdm=
i-a-6.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs@pipe-c-hdmi-a-6.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-4=
35/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">=
INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd=
-after-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-=
suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-=
for-each-pipe.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each=
-pipe.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_co=
lor@invalid-ctm-matrix-sizes.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-4/igt@kms_color@invalid-ctm-matrix-sizes.html">PASS</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp=
-6/igt@kms_color@invalid-ctm-matrix-sizes.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_col=
or@invalid-ctm-matrix-sizes.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +3 =
other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_cu=
rsor_crc@cursor-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-=
1/igt@kms_cursor_crc@cursor-dpms.html">PASS</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_curso=
r_crc@cursor-dpms.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms_cursor_crc@cursor-dpms.html=
">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-adlp-1/igt@kms_cursor_crc@cursor-dpms.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#=
4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b556=
0b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +=
2 other tests ( 2 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b556=
0b/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#229=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_=
cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atom=
ic-transitions.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-at=
omic-transitions.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_dp_=
aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_dp_a=
ux_dev.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/=
igt@kms_dp_aux_dev.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fea=
ture_discovery@display-2x.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
bmg-8/igt@kms_feature_discovery@display-2x.html">PASS</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/ig=
t@kms_feature_discovery@display-2x.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_feature_dis=
covery@display-2x.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-b=
mg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@km=
s_flip@2x-flip-vs-dpms-on-nop.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-=
dpms-on-nop.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ab-hdmi-a6-dp4.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2=
-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@bd-dp2-hdmi-a3.html">PASS</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/=
igt@kms_flip@2x-nonexisting-fb.html">PASS</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2=
/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
12 other tests ( 2 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-v=
blank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/=
igt@kms_flip@flip-vs-suspend.html">PASS</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_flip@flip=
-vs-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">DMESG-=
WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4173">Intel XE#4173</a>) +2 other tests ( 1 dmesg-warn, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblan=
k-ts-check@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@b-ed=
p1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">In=
tel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-upscaling.html">PASS</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip_scale=
d_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@k=
ms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Int=
el XE#4996</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_frontbuff=
er_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@fbc-suspend.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@k=
ms_frontbuffer_tracking@fbc-suspend.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@kms_frontbuff=
er_tracking@fbc-suspend.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_hdr=
@static-toggle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@k=
ms_hdr@static-toggle.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_hdr@static-toggle.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-8/igt@kms_hdr@static-toggle.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms=
_hdr@static-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test ( 2 pass, 1 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_inv=
alid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@kms=
_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/i=
gt@kms_invalid_mode@zero-vdisplay@pipe-a-hdmi-a-1.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_joi=
ner@basic-force-big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard=
-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/ig=
t@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_joiner@bas=
ic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_joiner@basic-ultra-joi=
ner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Int=
el XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pi=
pe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-h=
dmi-a-1.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-b-hdmi-a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read=
-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests ( 1=
 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-pixel-format.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_plane_=
scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms=
_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
63">Intel XE#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_plane_=
scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shar=
d-adlp-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/=
igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_psr@fbc-psr-primary-bl=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-dg2-434/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_vrr@seamless-rr-switch=
-drrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-dg2-434/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-pad:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_crea=
te@invalid-pad.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_create@invalid-pad.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-adlp-1/igt@xe_create@invalid-pad.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@x=
e_create@invalid-pad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_eudebug_online@writes-c=
aching-vram-bb-sram-target-sram.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_eudebug_onlin=
e@writes-caching-vram-bb-sram-target-sram.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_ex=
ec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-basic-defer-bind.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-436/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2=
-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_ex=
ec_basic@multigpu-once-basic-defer-mmap.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd=
2b5560b/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html=
">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) +12 other tests ( 2 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-onc=
e-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_basic@multigpu=
-once-userptr-invalidate-race.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test (=
 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_fault_mode@once-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-b=
indexecqueue-userptr-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_fault_mode@twic=
e-bindexecqueue-userptr-imm.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-new-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_exec_system_allocato=
r@many-execqueues-mmap-new-huge.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_system_allocator@m=
any-mmap-huge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/shard-dg2-432/igt@xe_exec_system_allocator@many-mmap=
-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4915">Intel XE#4915</a>) +35 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-file-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@xe_exec_system_allocator@pr=
ocess-many-stride-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-3/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/i=
gt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-8/igt@xe_pm@s4-d3hot=
-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +2 ot=
her tests ( 1 abort, 2 pass )</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exe=
c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-=
4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@xe_pm@=
s4-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/i=
gt@xe_pm@s4-multiple-execs.html">PASS</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_pm@s4-multip=
le-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-a=
dlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-6/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@xe_pm@=
s4-vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp=
-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.=
html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_query@multigpu-query-gt=
-list.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_vm@=
munmap-style-unbind-one-partial.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/=
shard-adlp-4/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-adlp-8/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@xe_vm@munmap-style-unbind-one-partial.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +9 o=
ther tests ( 1 pass, 1 skip )</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-async-flip.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@k=
ms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b2=
60d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data=
-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs@pipe-b-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-435/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-d=
g2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PAS=
S</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-436/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe=
-b-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_cur=
sor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b55=
60b/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">I=
ntel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomi=
c.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"=
>PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1=
180a9dd2b5560b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tr=
ansitions.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_cursor_legacy@cu=
rsorb-vs-flipb-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_dp_=
linktrain_fallback@dp-fallback.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#42=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9254v2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@bc-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hd=
mi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@2x-flip-vs-modeset-vs-hang.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-bmg-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@2x-modeset-vs-vblank-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shar=
d-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/i=
gt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) +1 other test ( 2 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_f=
lip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interrup=
tible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3549">Intel XE#3549</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_flip@flip-vs-abso=
lute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_flip@flip-vs-ab=
solute-wf_vblank-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip@flip-vs-=
absolute-wf_vblank-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_f=
lip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-i=
nterruptible@d-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3549">Intel XE#3549</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-433/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@=
kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html">PASS</a>) +3 =
other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-2/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-=
WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_flip@flip-vs-sus=
pend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331c=
a1180a9dd2b5560b/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-=
hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_fl=
ip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@wf_vblank-ts-check.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2=
/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/=
igt@kms_flip@wf_vblank-ts-check.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@wf_vblank=
-ts-check.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_flip=
@wf_vblank-ts-check@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_f=
lip@wf_vblank-ts-check@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#28=
82</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49254v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-bmg-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspen=
d.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@xe_ex=
ec_basic@multigpu-once-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-dg2-436/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-d=
g2-434/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a>) +8 other test=
s ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@xe_modu=
le_load@reload-no-display.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-=
bmg-3/igt@xe_module_load@reload-no-display.html">ABORT</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-bmg-7/igt@xe_module_load@reload-no-display.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@xe=
_module_load@reload-no-display.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@xe_module_load@relo=
ad-no-display.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s=
4-exec-after.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-8/igt@xe=
_pm@s4-exec-after.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-7/igt@xe_pm@s4-ex=
ec-after.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-8/=
igt@xe_pm@s4-exec-after.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@xe_pm@=
s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-9/=
igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-1/i=
gt@xe_pm@s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-user=
ptr.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_b=
ig_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sh=
ard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9254v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-ad=
lp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-display=
s-3840x2160p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd=
2b5560b/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_ccs@bad-pixel-form=
at-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-=
y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Inte=
l XE#787</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_c=
cs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@bad-pix=
el-format-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@bad-pixel=
-format-y-tiled-gen12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cc=
s@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9d=
d2b5560b/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_ccs@crc-primary-su=
spend-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_c=
cs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180=
a9dd2b5560b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard=
-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b=
5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">IN=
COMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard=
-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#43=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/452=
2">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1=
180a9dd2b5560b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs=
-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#312=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149254v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4=
522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_ccs@random-=
ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_con=
tent_protection@lic-type-0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard=
-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-bmg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/ig=
t@kms_content_protection@lic-type-0.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_content_pr=
otection@lic-type-0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_con=
tent_protection@srm.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/=
igt@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-bmg-7/igt@kms_content_protection@srm.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_con=
tent_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_con=
tent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg=
-2/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bm=
g-4/igt@kms_content_protection@uevent.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_content_=
protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_c=
ursor_crc@cursor-rapid-movement-256x85.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2=
b5560b/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_cursor_crc@curs=
or-rapid-movement-256x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_cursor_crc@cursor-r=
apid-movement-256x85.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other t=
ests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">=
Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149254v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-lega=
cy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4996">Intel XE#4996</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-c=
ursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-mode=
set-vs-cursor-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests ( 2 pass,=
 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/=
igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_=
cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-ad=
lp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-ad=
lp-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_dirtyf=
b@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test=
 ( 2 skip )</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_d=
irtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-d=
g2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-dg2-466/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg=
2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/sha=
rd-adlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14925=
4v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp=
-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4=
996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fli=
p@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9=
dd2b5560b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hd=
mi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-435/igt@kms_f=
lip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d8=
5e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2=
/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi=
-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-inter=
ruptible@bd-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard=
-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-b=
mg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@kms_f=
lip@wf_vblank-ts-check@a-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-4/igt@kms_flip@wf_vblank-t=
s-check@a-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/886">Intel XE#886</a>) +1 other test ( 1 fail, 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_f=
lip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscal=
ing.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primsc=
rn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/igt@kms_front=
buffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard=
-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +20 other tests ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-prim=
scrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/i=
gt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_f=
rontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-pr=
imscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-d=
g2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14925=
4v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgfli=
p-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgfli=
p-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-in=
dfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-sc=
ndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 othe=
r tests ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scnd=
scrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">In=
tel XE#4996</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-sc=
ndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms=
_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-=
434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-8/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b=
260d85e65f9331ca1180a9dd2b5560b/shard-adlp-1/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mma=
p-wc.html">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149254v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca118=
0a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-mult=
idraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_front=
buffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_fro=
ntbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dr=
aw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cu=
r-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 o=
ther test ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254=
v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mma=
p-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other te=
sts ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other t=
est ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mma=
p-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e=
65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-=
blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-w=
c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p=
-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_frontbuffer_track=
ing@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +1 other test ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a=
9dd2b5560b/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-bl=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb565-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb565-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5=
560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@kms_frontbuffer_trackin=
g@fbcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b55=
60b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">In=
tel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d=
85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-=
6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_f=
rontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260=
d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-d=
g2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-rende=
r.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149254v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bm=
g-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
13">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-in=
dfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) +4 other tests ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f93=
31ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2313">Intel XE#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-in=
dfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests ( =
3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f=
9331ca1180a9dd2b5560b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-=
8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
2">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-prims=
crn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) +2 other tests ( 3 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@kms_p=
lane_lowres@tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-4=
33/igt@kms_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@km=
s_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bm=
g-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-7/igt@kms_plane=
_multiple@2x-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149254v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-1/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149254v2/shard-bmg-8/igt@kms_plane_multiple@2x-ti=
ling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ps=
r@pr-sprite-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/=
igt@kms_psr@pr-sprite-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-adlp-8/igt@kms_psr@pr-sprite-render.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@kms_psr@pr-=
sprite-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_p=
sr@psr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/=
igt@kms_psr@psr-sprite-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-dg2-434/igt@kms_psr@psr-sprite-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_psr@psr=
-sprite-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#92=
9</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@kms_ps=
r@psr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/ig=
t@kms_psr@psr-sprite-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-ad=
lp-6/igt@kms_psr@psr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@kms_psr@psr-sprit=
e-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4996">Intel XE#4996</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/s=
hard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
254v2/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-=
adlp-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@kms_t=
iled_display@basic-test-pattern.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/=
shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149254v2/shard-dg2-466/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149254v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29">Intel XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_cre=
ate@create-big-vram.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4=
/igt@xe_create@create-big-vram.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/i=
gt@xe_create@create-big-vram.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_create@create-big=
-vram.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_eud=
ebug@discovery-empty.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-=
6/igt@xe_eudebug@discovery-empty.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6=
/igt@xe_eudebug@discovery-empty.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-8/igt@xe_eudebug@discov=
ery-empty.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_eu=
debug@discovery-empty.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-=
433/igt@xe_eudebug@discovery-empty.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-=
466/igt@xe_eudebug@discovery-empty.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_eudebug@di=
scovery-empty.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-free:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_ex=
ec_compute_mode@once-userptr-free.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560=
b/shard-dg2-433/igt@xe_exec_compute_mode@once-userptr-free.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149254v2/shard-dg2-434/igt@xe_exec_compute_mode@once-userptr-free.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1492=
54v2/shard-dg2-466/igt@xe_exec_compute_mode@once-userptr-free.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +10 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_ex=
ec_system_allocator@many-execqueues-mmap-huge.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca11=
80a9dd2b5560b/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mm=
ap-huge.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_exec_system_allo=
cator@many-execqueues-mmap-huge.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@xe_exec_system_a=
llocator@many-execqueues-mmap-huge.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-shared-remap.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e6=
5f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_exec_system_allocator@threads-m=
any-large-mmap-shared-remap.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@=
xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shar=
d-adlp-8/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4915">Intel XE#4915</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +18 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9=
331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_=
guc_mmio_send_recv.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_=
fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp=
-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOU=
T</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911=
">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_oa@=
invalid-oa-exponent.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-4=
/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/=
shard-adlp-8/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-adlp-6/igt@xe_oa@=
invalid-oa-exponent.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_oa=
@invalid-oa-exponent.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-4=
34/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-43=
4/igt@xe_oa@invalid-oa-exponent.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_oa@invalid-oa=
-exponent.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-lnl-1/igt@xe_pm@s4-=
vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149254v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.htm=
l">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9254v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-adlp-6/igt@xe_pxp=
@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/=
shard-adlp-4/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#=
4733</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149254v2/shard-adlp-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/s=
hard-adlp-8/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4=
733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
45">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/igt@xe_px=
p@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b=
/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149254v2/shard-dg2-466/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v=
2/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-434/igt@xe_sr=
iov_flr@flr-twice.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b/shard-dg2-433/=
igt@xe_sriov_flr@flr-twice.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149254v2/shard-dg2-434/igt@=
xe_sriov_flr@flr-twice.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149254v2/shard-dg2-466/igt@xe_sriov_flr@flr-twice.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b -&gt; xe-pw-149=
254v2</li>
</ul>
<p>IGT_8371: 8371<br />
  xe-3119-3695d568b260d85e65f9331ca1180a9dd2b5560b: 3695d568b260d85e65f9331=
ca1180a9dd2b5560b<br />
  xe-pw-149254v2: 149254v2</p>

</body>
</html>

--===============2096115303118368837==--
