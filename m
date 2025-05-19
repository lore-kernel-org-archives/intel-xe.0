Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3BC3ABD8
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 10:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6F810E13C;
	Mon, 19 May 2025 10:24:23 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA88210E124;
 Mon, 19 May 2025 10:24:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8644284788295438827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/psr=3A_Underrun_o?=
 =?utf-8?q?n_idle_PSR_wa_only_when_pkgc_latency_=3E_delayed_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 10:24:22 -0000
Message-ID: <174765026273.93344.8192752593481231131@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250519075223.443266-1-jouni.hogander@intel.com>
In-Reply-To: <20250519075223.443266-1-jouni.hogander@intel.com>
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

--===============8644284788295438827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank
URL   : https://patchwork.freedesktop.org/series/149170/
State : failure

== Summary ==

CI Bug Log - changes from xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01_FULL -> xe-pw-149170v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149170v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149170v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149170v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip@dpms-off-confusion-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@dpms-off-confusion-interruptible.html

  
Known issues
------------

  Here are the changes found in xe-pw-149170v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#3428])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#4427])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@kms_async_flips@async-flip-suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][7] ([Intel XE#4427])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#619])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#619])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +265 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#787]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#3124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1727] / [Intel XE#3113])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#4418])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#4417]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_color@deep-color@pipe-a-dp-2-ctm:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][36] ([Intel XE#3428]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1188])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2320] / [Intel XE#5042]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_cursor_crc@cursor-random-64x64.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2291]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#1475])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4494])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#3009])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_dp_aux_dev.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#4354])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4356])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#4294])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][56] -> [FAIL][57] ([Intel XE#2882]) +4 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#310]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#886]) +4 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3321]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [PASS][64] -> [FAIL][65] ([Intel XE#301]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301]) +3 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301] / [Intel XE#3321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#651]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1151])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#653]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#653]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#656]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#4883])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#1503])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#346])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2927])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#3428]) +9 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#4596]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2763]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1489]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1489])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#2168])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_vrr@cmrr.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1091] / [Intel XE#2849])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][94] ([Intel XE#2705])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@testdisplay.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1126])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#4837]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4837]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#1392]) +13 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#288]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4915]) +34 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#4915]) +23 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_system_allocator@once-new-busy-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-4/igt@xe_module_load@many-reload.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2541] / [Intel XE#3573])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1337])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         NOTRUN -> [ABORT][110] ([Intel XE#1794])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][111] -> [DMESG-WARN][112] ([Intel XE#4173]) +7 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4733])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#944])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#944])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][116] ([Intel XE#3908]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#4543]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][120] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][122] ([Intel XE#2291]) -> [PASS][123] +2 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][124] ([Intel XE#1340]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][126] ([Intel XE#4354]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][128] ([Intel XE#2316]) -> [PASS][129] +7 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][130] ([Intel XE#301]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:
    - shard-bmg:          [FAIL][132] ([Intel XE#886]) -> [PASS][133] +4 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop@d-dp2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_flip@flip-vs-dpms-on-nop@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][134] ([Intel XE#3321]) -> [PASS][135] +3 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][136] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][138] ([Intel XE#2882]) -> [PASS][139] +2 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [INCOMPLETE][140] -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1392]) -> [PASS][143] +9 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_capture@reset:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#5016]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@xe_exec_capture@reset.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@xe_exec_capture@reset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset:
    - shard-bmg:          [DMESG-WARN][146] ([Intel XE#3428]) -> [PASS][147] +4 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][148] ([Intel XE#2327] / [Intel XE#5042]) -> [SKIP][149] ([Intel XE#2327])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][150] ([Intel XE#2652] / [Intel XE#5042] / [Intel XE#787]) -> [SKIP][151] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][152] ([Intel XE#1178]) -> [SKIP][153] ([Intel XE#2341])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_content_protection@atomic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][154] ([Intel XE#2341]) -> [FAIL][155] ([Intel XE#1178])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][156] ([Intel XE#2341] / [Intel XE#5042]) -> [FAIL][157] ([Intel XE#1178])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_content_protection@srm.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][158] ([Intel XE#2320] / [Intel XE#5042]) -> [SKIP][159] ([Intel XE#2321])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][160] ([Intel XE#2291]) -> [DMESG-WARN][161] ([Intel XE#3428])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][162] ([Intel XE#2316]) -> [FAIL][163] ([Intel XE#886])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#2312]) +21 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][166] ([Intel XE#4141]) -> [SKIP][167] ([Intel XE#2312] / [Intel XE#5042])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#4141]) -> [SKIP][169] ([Intel XE#2312]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#4141]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [SKIP][172] ([Intel XE#4141]) -> [SKIP][173] ([Intel XE#4141] / [Intel XE#5042]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][174] ([Intel XE#2311]) -> [SKIP][175] ([Intel XE#2311] / [Intel XE#5042]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][176] ([Intel XE#2312]) -> [SKIP][177] ([Intel XE#2312] / [Intel XE#5042])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][178] ([Intel XE#2312]) -> [SKIP][179] ([Intel XE#2311]) +12 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][180] ([Intel XE#2312] / [Intel XE#5042]) -> [SKIP][181] ([Intel XE#2311])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-bmg:          [SKIP][182] ([Intel XE#2311] / [Intel XE#5042]) -> [SKIP][183] ([Intel XE#2311])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][184] ([Intel XE#2312]) -> [SKIP][185] ([Intel XE#2313]) +12 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][186] ([Intel XE#2313]) -> [SKIP][187] ([Intel XE#2312]) +17 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-bmg:          [SKIP][188] ([Intel XE#2313] / [Intel XE#5042]) -> [SKIP][189] ([Intel XE#2313])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          [SKIP][190] ([Intel XE#2313]) -> [SKIP][191] ([Intel XE#2313] / [Intel XE#5042]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][192] ([Intel XE#2313]) -> [SKIP][193] ([Intel XE#2312] / [Intel XE#5042])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312] / [Intel XE#5042]) -> [SKIP][195] ([Intel XE#2313])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][196] ([Intel XE#3544]) -> [SKIP][197] ([Intel XE#3374] / [Intel XE#3544])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [SKIP][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223]) ([Intel XE#2457]) -> ([PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [DMESG-WARN][243], [PASS][244], [DMESG-WARN][245], [PASS][246], [PASS][247], [PASS][248]) ([Intel XE#3428])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5016
  [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01 -> xe-pw-149170v1

  IGT_8366: 8366
  xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01: 458e77eea7d3b83219ed788387765ea71fb1bb01
  xe-pw-149170v1: 149170v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/index.html

--===============8644284788295438827==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Underrun on idle PSR wa only w=
hen pkgc latency &gt; delayed vblank</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149170/">https://patchwork.freedesktop.org/series/149170/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149170v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149170v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3106-458e77eea7d3b83219ed788387765ea71=
fb1bb01_FULL -&gt; xe-pw-149170v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149170v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149170v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1491=
70v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@dpms-off-confusion-interruptible:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip=
@dpms-off-confusion-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@dp=
ms-off-confusion-interruptible.html">DMESG-WARN</a> +2 other tests dmesg-wa=
rn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149170v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries-display-on.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-=
6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@kms_as=
ync_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4427">Intel XE#4427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_async_flips@async-flip-=
suspend-resume@pipe-d-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4427">Intel XE#4427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d=
-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_bw@connected-linear-tili=
ng-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +265 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_chamelium_audio@hdmi-au=
dio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_chamelium_color@ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_chamelium_edid@hdmi-edid=
-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-ctm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_color@deep-color@pipe-a-d=
p-2-ctm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_content_protection@lega=
cy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_curs=
or_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_crc@cur=
sor-random-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/s=
hard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-=
hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2882">Intel XE#2882</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking=
-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-n=
op@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-6/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-4=
35/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vb=
lank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vb=
lank@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_hdr@=
bpc-switch-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
883">Intel XE#4883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +9 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@kms_psr@psr-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-435/igt@testdisplay.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_eudebug@basic-exec-queues=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_eudebug_online@preempt-b=
reakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_evict@evict-beng-large.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-=
basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_system_allocator@ma=
ny-large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +34 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_exec_system_allocator@onc=
e-new-busy-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-4/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-4/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_pat@display-vs-wb-transie=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-2/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-adlp-3/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +7 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-adlp-9/igt@xe_query@multigpu-query-inva=
lid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_query@multigpu-query-top=
ology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149170v1/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149170v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149170v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149170v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-8/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg=
-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +7 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard=
-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_flip=
@flip-vs-dpms-on-nop@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_fl=
ip@flip-vs-dpms-on-nop@d-dp2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank@d-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/i=
gt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149170v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip=
@plain-flip-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/sh=
ard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-r=
ace.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149170v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execq=
ueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg=
2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +9 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_capture@reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-dg2-435/igt@xe_exe=
c_capture@reset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5016">Intel XE#5016</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-dg2-432/igt@xe_exec_captu=
re@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-free-race-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-many-stride-mmap-free-race-nomemset.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428=
">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149170v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-s=
tride-mmap-free-race-nomemset.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_big_=
fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-=
bmg-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149170v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652=
">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-7/ig=
t@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/sha=
rd-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149170v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1491=
70v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v=
1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-=
6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042"=
>Intel XE#5042</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149170v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149170v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5042">Intel XE#5042</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1=
/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49170v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
170v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#50=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/=
shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2313">Intel XE#2313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5042">Intel XE#5042</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1=
/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042"=
>Intel XE#5042</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149170v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn=
-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1=
bb01/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea7=
1fb1bb01/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed78838776=
5ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed7883=
87765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed=
788387765ea71fb1bb01/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b832=
19ed788387765ea71fb1bb01/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3=
b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e77ee=
a7d3b83219ed788387765ea71fb1bb01/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-458e=
77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3106-=
458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-8/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb0=
1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49170v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149170v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49170v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49170v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149170v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49170v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-6/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149170v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149170v1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3428">Intel XE#3428</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01 -&gt; xe-pw-149=
170v1</li>
</ul>
<p>IGT_8366: 8366<br />
  xe-3106-458e77eea7d3b83219ed788387765ea71fb1bb01: 458e77eea7d3b83219ed788=
387765ea71fb1bb01<br />
  xe-pw-149170v1: 149170v1</p>

</body>
</html>

--===============8644284788295438827==--
