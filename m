Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8144BC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 22:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B01C10E9EE;
	Thu, 30 Jan 2025 22:54:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6593D10E029;
 Thu, 30 Jan 2025 22:54:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1632876876996058602=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/vrr=3A_Fix_DSB+VR?=
 =?utf-8?q?R_usage_for_PTL+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 22:54:35 -0000
Message-ID: <173827767538.2996634.11802951361052743652@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130184518.22353-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250130184518.22353-1-ville.syrjala@linux.intel.com>
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

--===============1632876876996058602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: Fix DSB+VRR usage for PTL+
URL   : https://patchwork.freedesktop.org/series/144152/
State : failure

== Summary ==

CI Bug Log - changes from xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6_full -> xe-pw-144152v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144152v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144152v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144152v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-6/igt@kms_joiner@basic-force-big-joiner.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner@single:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner@single.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_query@query-cs-cycles:
    - shard-bmg:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@xe_query@query-cs-cycles.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_query@query-cs-cycles.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][15] ([Intel XE#1033]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) -> [INCOMPLETE][18] +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][19] ([Intel XE#3012]) -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  
Known issues
------------

  Here are the changes found in xe-pw-144152v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4173]) +2 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@core_hotunplug@hotrebind-lateclose.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#1033]) +2 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#607])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#1033]) +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#3442])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +97 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][37] -> [DMESG-WARN][38] ([Intel XE#4172]) +34 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3.html

  * igt@kms_color@ctm-negative:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#877]) +1 other test dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_color@ctm-negative.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_color@ctm-negative.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1188])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1033]) +37 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2291])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#4172] / [Intel XE#877])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][47] ([Intel XE#4172])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#2882])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][49] ([Intel XE#4172])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#886]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#2955])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953]) +1 other test dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#651]) +14 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#653]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][67] -> [ABORT][68] ([Intel XE#2625]) +1 other test abort
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@kms_hdr@bpc-switch-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][69] ([Intel XE#2625] / [Intel XE#4048])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#3012])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#2925])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2571])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [PASS][77] -> [DMESG-WARN][78] ([Intel XE#2566] / [Intel XE#4172])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#870])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1489]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1122])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#3414]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#1435])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][86] -> [ABORT][87] ([Intel XE#2625] / [Intel XE#4057])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][88] ([Intel XE#2625] / [Intel XE#4057])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#756]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2905]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][92] ([Intel XE#1473])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#1392]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_capture@reset:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][95] ([Intel XE#1033])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_exec_capture@reset.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#288]) +12 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2360])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#1192])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@xe_live_ktest@xe_mocs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2284] / [Intel XE#366])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#4172] / [Intel XE#569])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@xe_pm@s3-exec-after.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][104] -> [ABORT][105] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][106] -> [ABORT][107] ([Intel XE#1358] / [Intel XE#1607])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-5/igt@xe_pm@s4-basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][108] -> [ABORT][109] ([Intel XE#1358])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][110] -> [DMESG-WARN][111] ([Intel XE#1033] / [Intel XE#3088]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#944])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][113] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][115] ([Intel XE#3746] / [Intel XE#827]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][117] ([Intel XE#2625] / [Intel XE#4083]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [INCOMPLETE][119] ([Intel XE#3226]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][121] ([Intel XE#2291]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][123] ([Intel XE#2316]) -> [PASS][124] +1 other test pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][125] ([Intel XE#3321]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][127] ([Intel XE#2625]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][129] ([Intel XE#301]) -> [PASS][130] +6 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [DMESG-WARN][131] ([Intel XE#4172]) -> [PASS][132] +18 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#1033]) -> [PASS][134] +2 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][135] -> [PASS][136] +5 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1033] / [Intel XE#2566]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][139] ([Intel XE#1522]) -> [PASS][140] +9 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-6/igt@kms_vrr@flip-basic.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#1033]) -> [PASS][142] +20 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#1392]) -> [PASS][144] +3 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][145] ([Intel XE#3876]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][147] ([Intel XE#1192]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [SKIP][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174]) ([Intel XE#378]) -> ([PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [DMESG-WARN][201] ([Intel XE#4173]) -> [PASS][202] +6 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@xe_wedged@basic-wedged.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-2/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][203] ([Intel XE#2316]) -> [DMESG-FAIL][204] ([Intel XE#4172])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [DMESG-WARN][205] ([Intel XE#1033]) -> [INCOMPLETE][206] ([Intel XE#2049])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][207] ([Intel XE#1033]) -> [DMESG-FAIL][208] ([Intel XE#1033]) +1 other test dmesg-fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][209] ([Intel XE#4172]) -> [DMESG-WARN][210] ([Intel XE#4172])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][211] ([Intel XE#1033]) -> [DMESG-WARN][212] ([Intel XE#1033])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][213] ([Intel XE#1033] / [Intel XE#2625]) -> [DMESG-WARN][214] ([Intel XE#2955])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#2311]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#4141]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][219] ([Intel XE#4141]) -> [SKIP][220] ([Intel XE#2312]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#2311]) -> [SKIP][222] ([Intel XE#2312]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2313]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2313]) -> [SKIP][226] ([Intel XE#2312]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][227] ([Intel XE#3544]) -> [SKIP][228] ([Intel XE#3374] / [Intel XE#3544])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][229] ([Intel XE#2833]) -> [SKIP][230] ([Intel XE#1192])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [ABORT][231] ([Intel XE#1033] / [Intel XE#4046]) -> [DMESG-WARN][232] ([Intel XE#1033])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4083]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4083
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6 -> xe-pw-144152v1

  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6: e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6
  xe-pw-144152v1: 144152v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/index.html

--===============1632876876996058602==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: Fix DSB+VRR usage for PTL+</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144152/">https://patchwork.freedesktop.org/series/144152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144152v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144152v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c=
809c5c6_full -&gt; xe-pw-144152v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144152v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144152v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1441=
52v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_curs=
or_crc@cursor-offscreen-256x256.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_cr=
c@cursor-offscreen-256x256.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscre=
en-256x256@pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_cur=
sor_crc@cursor-sliding-64x21.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@kms_cursor_crc@=
cursor-sliding-64x21.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_jo=
iner@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_joiner@basi=
c-force-big-joiner.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-6/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner@single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_joiner@basic-force-big-jo=
iner@single.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_gt_freq@freq_reset_multi=
ple.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@xe_query=
@query-cs-cycles.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_query@query-cs-cycles.htm=
l">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
52v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.ht=
ml">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144152v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-=
2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_j=
oiner@basic-force-big-joiner.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144152v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@core_ho=
tunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@core_hotunplug@h=
otrebind-lateclose.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-=
dg2-463/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/s=
hard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_colo=
r@ctm-0-50@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_color@ctm-0-50=
@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +34 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_colo=
r@ctm-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_color@ctm-negative.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs=
-flip-atomic-transitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +37 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-5/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Int=
el XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436=
/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">=
Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-8/igt@kms=
_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_flip@2x-flip-=
vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-8/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-4/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-4/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@kms_hd=
r@bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_hdr@bpc-switch-sus=
pend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2625">Intel XE#2625</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@=
pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/sh=
ard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor=
-0-25.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_pm_backlight@basic-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_vblank@ts-=
continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@kms_vblank@ts-continuation-=
suspend@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@kms_writeback@writeback-pix=
el-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_eudebug_online@breakpoin=
t-many-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@xe_evict@evict-small.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@=
xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_capture@reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_exec_capture@reset.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-7/igt@xe_live_=
ktest@xe_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"=
>Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@xe_pm@s3=
-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144152v1/shard-bmg-6/igt@xe_pm@s3-exec-after.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417=
2">Intel XE#4172</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbi=
nd-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-5/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144152v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#135=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607=
">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_pm@=
s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_pm_=
residency@gt-c6-freeze.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_pm_residency@gt-c=
6-freeze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3=
718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144152v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-fl=
ip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#374=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"=
>Intel XE#827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144152v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4083">Intel XE#4083</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg=
2-436/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/s=
hard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144152v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
c-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-=
463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144152v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-3=
2bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> +18 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144152v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-8/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp=
-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2566">Intel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@kms_plane_scaling@planes=
-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-lnl-3/igt@kms_vrr@=
flip-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-lnl-6/igt@kms_vrr@flip-basic.h=
tml">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_evi=
ct_ccs@evict-overcommit-standalone-instantfree-reopen.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144152v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-ins=
tantfree-reopen.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-=
dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/sha=
rd-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-2/igt@xe_live_=
ktest@xe_dma_buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-7/igt@xe_live_ktest@=
xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c8=
09c5c6/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591=
a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d=
9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2d=
f5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac=
7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f=
6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
75-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809=
c5c6/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4=
c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0=
b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2d2df58=
01d9a0b591a4c6c809c5c6/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9eac7e2=
d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-e0f6b9=
eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2575-=
e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-43=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4152v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/sh=
ard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144152v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44152v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144152v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144152v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144152v1/shard-dg2-466/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@xe_pm@=
s3-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-434/igt@xe_=
pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-adlp-3/igt@xe_wedg=
ed@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-adlp-2/igt@xe_wedge=
d@basic-wedged.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/sh=
ard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg=
2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2=
049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
52v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1=
/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/s=
hard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-466=
/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
152v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144152v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
152v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-5/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-bmg-4/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-bmg-2/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6/shard-dg2-432/igt@xe_pm_=
residency@cpg-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4046">Intel XE#4046</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144152v1/shard-dg2-43=
6/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6 -&gt; xe-pw-144=
152v1</li>
</ul>
<p>IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2575-e0f6b9eac7e2d2df5801d9a0b591a4c6c809c5c6: e0f6b9eac7e2d2df5801d9a=
0b591a4c6c809c5c6<br />
  xe-pw-144152v1: 144152v1</p>

</body>
</html>

--===============1632876876996058602==--
