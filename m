Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5133DC02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 01:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2B10E178;
	Wed, 22 Jan 2025 01:50:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040D10E16A;
 Wed, 22 Jan 2025 01:50:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6454139851923096946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/backlight=3A_Retu?=
 =?utf-8?q?rn_immediately_when_scale=28=29_finds_invalid_parameters_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 01:50:44 -0000
Message-ID: <173751064411.2852180.3231754416746355095@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121145203.2851237-1-linux@roeck-us.net>
In-Reply-To: <20250121145203.2851237-1-linux@roeck-us.net>
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

--===============6454139851923096946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Return immediately when scale() finds invalid parameters (rev2)
URL   : https://patchwork.freedesktop.org/series/143773/
State : failure

== Summary ==

CI Bug Log - changes from xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b_full -> xe-pw-143773v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143773v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143773v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143773v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +25 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-adlp:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_pm@d3hot-mmap-system.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_pm@d3hot-mmap-system.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][11] ([Intel XE#1033]) -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          [SKIP][13] ([Intel XE#1439] / [Intel XE#3141]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in xe-pw-143773v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][17] ([Intel XE#1033]) +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3279])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][24] ([Intel XE#1033]) +1 other test dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#610])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1033]) +2 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +13 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#787]) +14 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#2692])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1727] / [Intel XE#2692] / [Intel XE#4010])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#2705])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@gamma:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][46] -> [DMESG-WARN][47] ([Intel XE#877])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_color@ctm-max@pipe-b-hdmi-a-3.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-7/igt@kms_color@ctm-max@pipe-b-hdmi-a-3.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#308])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1424]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#309]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#455]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2244])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#455]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#701])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#310])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][58] -> [FAIL][59] ([Intel XE#301]) +4 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#3321]) +9 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#886]) +4 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1397] / [Intel XE#1745])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#656]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#651]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#651]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#653]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#3374] / [Intel XE#3544])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][78] -> [DMESG-WARN][79] ([Intel XE#2566])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-dg2-set2:     [PASS][80] -> [INCOMPLETE][81] ([Intel XE#1035])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2763]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#2763]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][86] ([Intel XE#1033]) +2 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2938])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#836])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1489])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1489])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#2893]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2850] / [Intel XE#929])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1127])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1127])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#3414] / [Intel XE#3904])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#899]) +2 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#1522]) +9 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#756])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1126])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2905])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_evict@evict-beng-large:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-small:
    - shard-bmg:          [PASS][105] -> [DMESG-WARN][106] ([Intel XE#1473])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@xe_evict@evict-small.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1392]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#288]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#288]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2360])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2905]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2905]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#1999]) +2 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2248])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_oa@polling.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2248])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][118] -> [ABORT][119] ([Intel XE#1358] / [Intel XE#1607])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2280])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@xe_pm@s4-mocs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][122] -> [ABORT][123] ([Intel XE#1358] / [Intel XE#1794])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#944]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#944])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][126] ([Intel XE#3908]) -> [PASS][127] +3 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#1033]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][130] ([Intel XE#1033]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-adlp:         [DMESG-WARN][132] -> [PASS][133] +3 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][134] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][136] ([Intel XE#3321]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][138] ([Intel XE#301]) -> [PASS][139] +5 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][140] ([Intel XE#2882]) -> [PASS][141] +6 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [INCOMPLETE][142] -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank@a-dp2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][144] ([Intel XE#2953]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#2597]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#2882]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][150] ([Intel XE#2882]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#886]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][156] ([Intel XE#1503]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@xe_mmap@system:
    - shard-bmg:          [DMESG-WARN][158] -> [PASS][159] +19 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-2/igt@xe_mmap@system.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-7/igt@xe_mmap@system.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][160] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][162] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][164] -> [DMESG-WARN][165] ([Intel XE#877]) +1 other test dmesg-warn
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#1033]) -> [DMESG-WARN][167] ([Intel XE#2955]) +1 other test dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#2597]) -> [DMESG-WARN][169] ([Intel XE#1033])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [FAIL][170] ([Intel XE#886]) -> [FAIL][171] ([Intel XE#3149] / [Intel XE#886])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1033] / [Intel XE#2566]) -> [INCOMPLETE][173] ([Intel XE#1035] / [Intel XE#2566])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][174], [PASS][175], [PASS][176], [PASS][177], [DMESG-WARN][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [SKIP][198], [PASS][199]) ([Intel XE#378]) -> ([SKIP][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225]) ([Intel XE#378])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-9/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-9/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-9/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_module_load@load.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b -> xe-pw-143773v2

  IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b: 7727d97a1f38c61a60e87b2d38f7cc5a4aae277b
  xe-pw-143773v2: 143773v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/index.html

--===============6454139851923096946==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Return immediately when =
scale() finds invalid parameters (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143773/">https://patchwork.freedesktop.org/series/143773/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143773v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143773v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4=
aae277b_full -&gt; xe-pw-143773v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143773v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143773v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1437=
73v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">=
INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-=
bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.ht=
ml">DMESG-WARN</a> +25 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_pm_rpm@universal-planes-d=
pms.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_faul=
t_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp=
-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMES=
G-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_pm@d=
3hot-mmap-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_pm@d3hot-mmap-system.htm=
l">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMES=
G-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-8/igt@kms_pm_r=
pm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-=
lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143773v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-7/igt@kms_asyn=
c_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-3=
/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
33">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_async_flips@async-flip-w=
ith-page-flip-events.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_atomic@plane-primary-over=
lay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@4-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg=
2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">In=
tel XE#2692</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard=
-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_chamelium_color@gamma.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_chamelium_edid@hdmi-edid=
-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_colo=
r@ctm-max@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-7/igt@kms_color@ctm-max@p=
ipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_flip@2x-dpms-vs-vblank-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_flip@flip-v=
s-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_flip=
@wf_vblank-ts-check-interruptible@c-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-4/igt@kms_=
flip@wf_vblank-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">=
Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_plan=
e@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_plane@pixe=
l-format-source-clamping.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_pl=
ane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435=
/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">=
Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe=
-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@kms_plane_scaling@plane-sca=
ler-with-clipping-clamping-modifiers@pipe-d.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_psr@psr-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-5/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-6/igt@kms_universal_plan=
e@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_vrr@=
flip-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143773v2/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel=
 XE#1522</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_eudebug@discovery-race-v=
mbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_evict@evict-beng-large.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@xe_evict=
@evict-small.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@xe_evict@evict-small.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-ba=
sic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_exec_sip_eudebug@breakpoi=
nt-waitsip-heavy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_oa@polling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Inte=
l XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-5/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143773v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143773v2/shard-bmg-2/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#=
2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_query@multigpu-query-conf=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143773v2/shard-dg2-433/igt@xe_query@multigpu-query-inv=
alid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/=
shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143773v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43773v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d=
-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@kms_cur=
sor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@kms_c=
ursor_edge_walk@256x256-top-bottom.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143773v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
c-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143773v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-hdmi-a6-dp4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg=
-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-8/igt@kms_flip=
@blocking-absolute-wf_vblank@a-dp2.html">INCOMPLETE</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-8/igt@kms_=
flip@blocking-absolute-wf_vblank@a-dp2.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adl=
p-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/sh=
ard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-4=
66/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/sh=
ard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/sha=
rd-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-466/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible@b-hdmi-a6.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-466/=
igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-bmg-2/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-2/igt@xe_mmap@=
system.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143773v2/shard-bmg-7/igt@xe_mmap@system.html">PASS</a> +1=
9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-3/igt@xe_p=
m@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-2/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/sh=
ard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14377=
3v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-v=
arying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg2-435/igt@kms_=
flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-dg=
2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1=
033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-lnl-3/igt@kms_flip=
@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-lnl-4/ig=
t@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE=
#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-dg2-436/igt@kms_pl=
ane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#256=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
773v2/shard-dg2-435/igt@kms_plane@pixel-format-source-clamping.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
35">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/sha=
rd-adlp-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4=
aae277b/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7=
cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87=
b2d38f7cc5a4aae277b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a=
60e87b2d38f7cc5a4aae277b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f3=
8c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d9=
7a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7=
727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/shard=
-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b/=
shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae=
277b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38f7cc5=
a4aae277b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87b2d38=
f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a60e87=
b2d38f7cc5a4aae277b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f38c61a=
60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d97a1f3=
8c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2520-7727d9=
7a1f38c61a60e87b2d38f7cc5a4aae277b/shard-adlp-8/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shar=
d-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143773v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773=
v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43773v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143773v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shar=
d-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143773v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773=
v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143773v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43773v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143773v2/shard-adlp-4/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b -&gt; xe-pw-143=
773v2</li>
</ul>
<p>IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2520-7727d97a1f38c61a60e87b2d38f7cc5a4aae277b: 7727d97a1f38c61a60e87b2=
d38f7cc5a4aae277b<br />
  xe-pw-143773v2: 143773v2</p>

</body>
</html>

--===============6454139851923096946==--
