Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2098C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 23:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8837210E52C;
	Wed, 15 Jan 2025 23:04:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198510E477;
 Wed, 15 Jan 2025 23:04:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6339885815560647015=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Add_sk?=
 =?utf-8?q?ip_link_check_quirk_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Denose" <jdenose@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 23:04:15 -0000
Message-ID: <173698225557.4112286.14889447132338079388@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
In-Reply-To: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
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

--===============6339885815560647015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add skip link check quirk (rev2)
URL   : https://patchwork.freedesktop.org/series/143563/
State : failure

== Summary ==

CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09_full -> xe-pw-143563v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143563v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143563v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143563v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +23 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_flip@dpms-off-confusion@d-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip@dpms-off-confusion@d-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_flip@dpms-off-confusion@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][4] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-userptr.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][7] ([Intel XE#1188]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-143563v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@fbdev@eof.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@fbdev@eof.html
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@eof.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@fbdev@eof.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#3701] / [Intel XE#827])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3279])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#3908]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][21] ([Intel XE#1033])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#1033]) +11 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#367]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +139 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#2692] / [Intel XE#4010])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#2705])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2907]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#373])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-signed:
    - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2953]) +8 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_color@ctm-signed.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#308]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#323]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([i915#4767])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#886]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#3820])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#301]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#301])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#2882]) +2 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-bmg:          [PASS][64] -> [INCOMPLETE][65] ([Intel XE#2635]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip@dpms-off-confusion.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#886])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][71] -> [DMESG-FAIL][72] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2136])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#656]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#658])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2136])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +33 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#651])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#651]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#653]) +27 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1158])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2136] / [Intel XE#2351])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#653]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#346])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#346])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2925])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#2934])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#346])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#3007]) +8 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_lease@lease-uevent.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#361])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#870])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#908])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1489]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1122]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1127])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3414])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#3414] / [Intel XE#3904])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#330])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][111] -> [ABORT][112] ([Intel XE#2625] / [Intel XE#4057])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][113] ([Intel XE#4057])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#756])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1126])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3889])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#3889])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#3889])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2905]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2905])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2905])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-4/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#1392]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null.html
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1392])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1130]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#1130]) +11 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288]) +23 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#288]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2360])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2229])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][133] ([Intel XE#1999]) +2 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][135] -> [ABORT][136] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2284] / [Intel XE#366])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     NOTRUN -> [ABORT][138] ([Intel XE#1358] / [Intel XE#1794])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#944])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#944]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@query-invalid-extension:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#1130]) +19 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_query@query-invalid-extension.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_query@query-invalid-extension.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][144] -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#3249]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][148] ([Intel XE#2134]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@fbdev@unaligned-read.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@fbdev@unaligned-read.html
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2134]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@unaligned-read.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-WARN][152] ([Intel XE#1033]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][154] ([Intel XE#827]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][156] ([Intel XE#3884]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][158] -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][160] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][161] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#2136]) -> [PASS][163] +4 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [DMESG-FAIL][166] ([Intel XE#1033]) -> [PASS][167] +10 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][168] -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_color@degamma:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2423] / [i915#2575]) -> [PASS][171] +13 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_color@degamma.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          [SKIP][172] ([Intel XE#3007]) -> [PASS][173] +9 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#2953]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][176] ([Intel XE#2291]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][180] ([Intel XE#2316]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][182] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [FAIL][184] ([Intel XE#3820]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][186] ([Intel XE#301]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][188] ([Intel XE#886]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][190] ([Intel XE#2882]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-dg2-set2:     [FAIL][192] -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][194] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][196] ([Intel XE#1861]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-lnl:          [INCOMPLETE][198] ([Intel XE#2050]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][200] ([Intel XE#1874]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - shard-bmg:          [DMESG-WARN][202] ([Intel XE#877]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][204] ([Intel XE#718]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][206] ([Intel XE#2029]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
    - shard-bmg:          [SKIP][208] ([Intel XE#1130]) -> [PASS][209] +27 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][210] ([Intel XE#1192]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [SKIP][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237]) ([Intel XE#2457]) -> ([PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][261], [SKIP][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286]) ([Intel XE#378]) -> ([PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1130]) -> [PASS][313] +20 other tests pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [ABORT][314] ([Intel XE#1358]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_pm@s2idle-multiple-execs.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2423] / [i915#2575]) -> [SKIP][317] ([Intel XE#455])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-bmg:          [SKIP][318] ([Intel XE#3007]) -> [SKIP][319] ([Intel XE#2370])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1124]) -> [SKIP][321] ([Intel XE#2136] / [Intel XE#2351])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#1124])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-bmg:          [SKIP][324] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][325] ([Intel XE#1124]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][327] ([Intel XE#1124])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][328] ([Intel XE#1124]) -> [SKIP][329] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1124]) -> [SKIP][331] ([Intel XE#2136]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][332] ([Intel XE#3007]) -> [SKIP][333] ([Intel XE#2314] / [Intel XE#2894])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#2191])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2136]) -> [SKIP][337] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][338] ([Intel XE#3432]) -> [SKIP][339] ([Intel XE#2136] / [Intel XE#2231])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][341] ([Intel XE#2136])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][342] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][343] ([Intel XE#2887]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#2907]) -> [SKIP][345] ([Intel XE#2136])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][347] ([Intel XE#455] / [Intel XE#787])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][348] ([Intel XE#2252]) -> [SKIP][349] ([Intel XE#3007])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#373]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][352] ([Intel XE#3007]) -> [SKIP][353] ([Intel XE#2252])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#373]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][356] ([Intel XE#2341]) -> [FAIL][357] ([Intel XE#1178])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_content_protection@srm.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][358] ([Intel XE#1188]) -> [INCOMPLETE][359] ([Intel XE#2715])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_content_protection@uevent.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][360] ([Intel XE#2320]) -> [SKIP][361] ([Intel XE#3007])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][362] ([Intel XE#3007]) -> [SKIP][363] ([Intel XE#2320])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][364] ([Intel XE#2291]) -> [DMESG-WARN][365] ([Intel XE#877]) +1 other test dmesg-warn
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][366] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][367] ([Intel XE#2244])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_dsc@dsc-basic.html
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2351]) -> [SKIP][369] ([Intel XE#455])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_dsc@dsc-basic.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#455]) -> [SKIP][371] ([Intel XE#2136])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
    - shard-bmg:          [SKIP][372] ([Intel XE#2244]) -> [SKIP][373] ([Intel XE#2136] / [Intel XE#2231])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][374] ([Intel XE#3007]) -> [FAIL][375] ([Intel XE#2882] / [Intel XE#3820])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2423] / [i915#2575]) -> [FAIL][377] ([Intel XE#301])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][378] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][379] ([Intel XE#2293] / [Intel XE#2380])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][381] ([Intel XE#455])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][382] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][383] ([Intel XE#2311]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#651]) -> [SKIP][385] ([Intel XE#2136])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][386] ([Intel XE#2311]) -> [SKIP][387] ([Intel XE#2312]) +5 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [SKIP][389] ([Intel XE#2311]) +12 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][390] ([Intel XE#2333]) -> [SKIP][391] ([Intel XE#2136] / [Intel XE#2231])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][392] ([Intel XE#2333]) -> [SKIP][393] ([Intel XE#2312]) +3 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][394] ([Intel XE#2312]) -> [FAIL][395] ([Intel XE#2333]) +5 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][396] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][397] ([Intel XE#2333]) +2 other tests fail
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2136]) -> [SKIP][399] ([Intel XE#651]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][400] ([Intel XE#2311]) -> [SKIP][401] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][403] ([Intel XE#651]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#653]) -> [SKIP][405] ([Intel XE#2136])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][406] ([Intel XE#2313]) -> [SKIP][407] ([Intel XE#2312]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2136]) -> [SKIP][409] ([Intel XE#653]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][410] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][411] ([Intel XE#2313]) +4 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#653]) -> [SKIP][413] ([Intel XE#2136] / [Intel XE#2351])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][415] ([Intel XE#653])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][416] ([Intel XE#2313]) -> [SKIP][417] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][418] ([Intel XE#2312]) -> [SKIP][419] ([Intel XE#2313]) +13 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][420] ([Intel XE#3007]) -> [SKIP][421] ([Intel XE#2493])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][422] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][423] ([Intel XE#870])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#2136]) -> [SKIP][425] ([Intel XE#870])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][427] ([Intel XE#908])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [SKIP][428] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][429] ([Intel XE#1430])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][430] ([Intel XE#1489]) -> [SKIP][431] ([Intel XE#2136] / [Intel XE#2231])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#1489]) -> [SKIP][433] ([Intel XE#2136])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][434] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][435] ([Intel XE#1489]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#1489]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][438] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][439] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][441] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][443] ([Intel XE#2136] / [Intel XE#2351])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-bmg:          [SKIP][444] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][445] ([Intel XE#2136] / [Intel XE#2231])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_psr@fbc-psr-no-drrs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#2136]) -> [SKIP][447] ([Intel XE#2850] / [Intel XE#929])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][448] ([Intel XE#3007]) -> [SKIP][449] ([Intel XE#2426])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#2423] / [i915#2575]) -> [SKIP][451] ([Intel XE#362])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][452] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][453] ([Intel XE#3007])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][455] ([Intel XE#2423] / [i915#2575])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1130]) -> [SKIP][457] ([Intel XE#1123])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][458] ([Intel XE#1130]) -> [SKIP][459] ([Intel XE#2905]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_eudebug@basic-read-event.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#1130]) -> [SKIP][461] ([Intel XE#2905]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_eudebug_online@debugger-reopen.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          [SKIP][462] ([Intel XE#1130]) -> [SKIP][463] ([Intel XE#2322]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#288]) -> [SKIP][465] ([Intel XE#1130]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#1130]) -> [SKIP][467] ([Intel XE#288]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1130]) -> [SKIP][469] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][471] ([Intel XE#1130])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait-cfg.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
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
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * IGT: IGT_8191 -> IGT_8192
  * Linux: xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09 -> xe-pw-143563v2

  IGT_8191: b8395f7e32e23c9e330e9d90d85f3f3a1dd08bda @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8192: a3b85ce819b99284bef57aafc7d44f50a62e097f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09: 72400937e76c02ae6345f0dfa5a598f0b284ab09
  xe-pw-143563v2: 143563v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/index.html

--===============6339885815560647015==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add skip link check quirk =
(rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143563/">https://patchwork.freedesktop.org/series/143563/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143563v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b=
284ab09_full -&gt; xe-pw-143563v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143563v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143563v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1435=
63v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> +23=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip=
@dpms-off-confusion@d-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_flip@dpms-o=
ff-confusion@d-hdmi-a3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-chec=
k@a-hdmi-a2.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@xe_exec=
_compute_mode@many-execqueues-userptr.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@xe_exe=
c_compute_mode@many-execqueues-userptr.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@uevent@pipe-a-dp-4:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_co=
ntent_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-4=
64/igt@kms_content_protection@uevent@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143563v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@fbdev@eo=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143563v2/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@=
eof.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143563v2/shard-dg2-433/igt@fbdev@eof.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel =
XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bm=
g-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
01">Intel XE#3701</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adl=
p-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@=
random-ccs-data-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_ccs@rando=
m-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">In=
tel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_chamelium_edid@vga-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_col=
or@ctm-signed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_color@ctm-signed.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2953">Intel XE#2953</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-2/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_fl=
ip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms=
_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt=
@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@kms_flip=
@dpms-off-confusion.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_flip@dpms-off-confusi=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2635">Intel XE#2635</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-chec=
k.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sha=
rd-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143563v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +33 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-8/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_leas=
e@lease-uevent.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_lease@lease-uevent.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/300=
7">Intel XE#3007</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-5-with-rotation.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg=
2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-8/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908=
">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane=
-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-3/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_vblank@ts-=
continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@kms_vblank@ts-continuation-=
suspend@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_writeback@writeback-fb-=
id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_eudebug@basic-vm-access-=
parameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufe=
nce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_eudebug_online@interrupt=
-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-4/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-=
dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-n=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_exec_basic@no-exec-binde=
xecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exe=
c_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/s=
hard-dg2-433/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_pm@=
s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-lnl-6/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_query=
@query-invalid-extension.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_query@query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +19 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@core_set=
master@master-drop-set-user.html">FAIL</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@core_setmaster@ma=
ster-drop-set-user.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt=
@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@fbdev@un=
aligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@fbdev@unaligned-re=
ad.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@fbdev@=
unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@fbdev@unaligne=
d-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-=
adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE=
#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143563v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@=
pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-=
1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-1/igt@km=
s_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-=
rotate-180-async-flip.html">PASS</a> +4 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shar=
d-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-=
hflip.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-=
dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_co=
lor@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms=
_color@degamma.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/=
igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">PASS</a> +9 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sh=
ard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-1/igt@kms_fbco=
n_fbt@psr-suspend.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
63v2/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820">Intel XE#3820</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2=
/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sha=
rd-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_fl=
ip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/=
igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-4=
32/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/=
igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-4/igt@kms_flip_sca=
led_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
63v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip=
-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-modesetfrombusy.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/s=
hard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-adlp-3/igt@kms_pla=
ne_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-adlp-2=
/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
7">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143563v2/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-facto=
r-0-75-with-pixel-format@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-7/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-lnl-5/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_=
threads@threads-bal-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-=
6/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html">PASS</a> +27 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_live_ktest@xe_bo=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284=
ab09/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0=
b284ab09/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a5=
98f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0df=
a5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345=
f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae=
6345f0dfa5a598f0b284ab09/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c=
02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937=
e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-7240=
0937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-=
72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab0=
9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b2=
84ab09/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a5=
98f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f=
0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02a=
e6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e=
76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-724=
00937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
92-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284=
ab09/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598=
f0b284ab09/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0df=
a5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae63=
45f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c=
02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-724009=
37e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-=
72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3563v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sh=
ard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143563v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-4=
33/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-143563v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143563v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_pm@=
s2idle-exec-after.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@xe_pm@s2idl=
e-exec-after.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-432/igt@xe_pm@=
s2idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@xe_pm@=
s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_at=
omic_transition@plane-all-modeset-transition-fencing-internal-panels.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007=
">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@k=
ms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#22=
31</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3563v2/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143563v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel X=
E#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143563v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests=
 skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143563v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sh=
ard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143563v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_cc=
s@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2=
-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">I=
ntel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE=
#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sh=
ard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_ccs@=
missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2=
231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
563v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cham=
elium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/s=
hard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
07">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ch=
amelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/s=
hard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_cham=
elium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-8/igt@kms_=
chamelium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ch=
amelium_frames@dp-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shar=
d-dg2-464/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-436/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_c=
ontent_protection@uevent.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-1/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143563v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_dsc@=
dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@kms_dsc=
@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ds=
c@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/igt@kms_dsc@dsc-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-464/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_dsc@dsc-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-=
bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3820">Intel XE#3820</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143563v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
1">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-t=
o-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143563v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143563v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscr=
en-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel X=
E#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
63v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143563v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#23=
33</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
63v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143563v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v=
2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Inte=
l XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143563v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscre=
n-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143563v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143563v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143563v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43563v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v=
2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg=
-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-436/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-434/igt@km=
s_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_pm_d=
c@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-7/igt@kms_pm=
_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-8/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/=
shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@kms_ps=
r2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v=
2/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">In=
tel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143563v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dm=
g-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ps=
r2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1435=
63v2/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-bi=
g-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_psr@=
fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-b=
mg-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE=
#2850</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ps=
r@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/igt=
@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-6/igt@kms_psr@=
fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-5/igt@k=
ms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ps=
r@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@kms=
_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sha=
rd-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143563v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-1/igt@sriov_ba=
sic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shar=
d-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a=
>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-433/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sh=
ard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-464/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_eudeb=
ug@basic-read-event.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-bmg-4/igt@xe_eudebug@=
basic-read-event.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_eud=
ebug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-463/igt@x=
e_eudebug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/sha=
rd-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">=
Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_exe=
c_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-433/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard=
-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel=
 XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-435/igt@xe_oa@=
invalid-create-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-433/=
igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#=
3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/shard-dg2-463/igt@xe_oa@=
syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143563v2/shard-dg2-=
433/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8191 -&gt; IGT_8192</li>
<li>Linux: xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09 -&gt; xe-pw-143=
563v2</li>
</ul>
<p>IGT_8191: b8395f7e32e23c9e330e9d90d85f3f3a1dd08bda @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8192: a3b85ce819b99284bef57aafc7d44f50a62e097f @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09: 72400937e76c02ae6345f0d=
fa5a598f0b284ab09<br />
  xe-pw-143563v2: 143563v2</p>

</body>
</html>

--===============6339885815560647015==--
