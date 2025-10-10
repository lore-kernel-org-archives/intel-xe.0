Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26190CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 03:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B7610E31F;
	Fri, 10 Oct 2025 03:48:03 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20D10E31F;
 Fri, 10 Oct 2025 03:48:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2054724637053573221=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Enable_media_sam?=
 =?utf-8?q?pler_power_gating_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 03:48:03 -0000
Message-ID: <176006808310.25588.17185912366914453665@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
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

--===============2054724637053573221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable media sampler power gating (rev3)
URL   : https://patchwork.freedesktop.org/series/155564/
State : failure

== Summary ==

CI Bug Log - changes from xe-3892-7896357960ab49751bdda502f7838b51730f9b51_FULL -> xe-pw-155564v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155564v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155564v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155564v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-434/igt@kms_cursor_legacy@single-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-463/igt@kms_cursor_legacy@single-move.html

  
New tests
---------

  New tests have been introduced between xe-3892-7896357960ab49751bdda502f7838b51730f9b51_FULL and xe-pw-155564v3_FULL:

### New IGT tests (70) ###

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.72] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.14] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.44] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.06] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.68] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_universal_plane@universal-plane-functional@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_universal_plane@universal-plane-sanity@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  

Known issues
------------

  Here are the changes found in xe-pw-155564v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#787]) +20 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8] ([Intel XE#3862]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#6168])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][13] ([Intel XE#1727] / [Intel XE#3113])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2907])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#306])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#373]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#308])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2291])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#309])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301]) +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#4543] / [Intel XE#5208])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#4543]) +9 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][30] -> [DMESG-FAIL][31] ([Intel XE#4543]) +1 other test dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#651]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#656]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#653]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1158])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_getfb@getfb2-handle-protection:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_getfb@getfb2-handle-protection.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@kms_getfb@getfb2-handle-protection.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#1503])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4596])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#3309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1406] / [Intel XE#2893])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1128] / [Intel XE#1406])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1729])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#330])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#2168])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1126]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4837]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#4837]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4518])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#688])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1392]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#288]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4915]) +52 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#5100])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#3573])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_oa@stress-open-close.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1420] / [Intel XE#2838])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4650])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][65] ([Intel XE#6168] / [i915#14968]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][67] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#2049]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][71] ([Intel XE#2316]) -> [PASS][72] +3 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][73] ([Intel XE#4543]) -> [PASS][74] +6 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_event_leak@basic:
    - shard-adlp:         [DMESG-WARN][77] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_flip_event_leak@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@kms_flip_event_leak@basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - shard-dg2-set2:     [INCOMPLETE][81] ([Intel XE#4842]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-463/igt@xe_exec_threads@threads-cm-userptr-rebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_exec_threads@threads-cm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [DMESG-WARN][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][85] ([Intel XE#5841]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-lnl-1/igt@xe_pmu@gt-frequency.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-2/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][87] ([Intel XE#4543]) -> [DMESG-FAIL][88] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][90] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][91] ([Intel XE#2311]) -> [SKIP][92] ([Intel XE#2312]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][93] ([Intel XE#2312]) -> [SKIP][94] ([Intel XE#2311]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][95] ([Intel XE#2312]) -> [SKIP][96] ([Intel XE#5390]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][97] ([Intel XE#5390]) -> [SKIP][98] ([Intel XE#2312])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][99] ([Intel XE#2313]) -> [SKIP][100] ([Intel XE#2312]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][101] ([Intel XE#2312]) -> [SKIP][102] ([Intel XE#2313]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][103] ([Intel XE#2509]) -> [SKIP][104] ([Intel XE#2426])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][105] ([Intel XE#5530]) -> [ABORT][106] ([Intel XE#4917] / [Intel XE#5530])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][107] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][108] ([Intel XE#5466] / [Intel XE#5530])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [SKIP][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [SKIP][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [DMESG-WARN][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173] / [Intel XE#5612])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#14968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14968


Build changes
-------------

  * Linux: xe-3892-7896357960ab49751bdda502f7838b51730f9b51 -> xe-pw-155564v3

  IGT_8581: 8581
  xe-3892-7896357960ab49751bdda502f7838b51730f9b51: 7896357960ab49751bdda502f7838b51730f9b51
  xe-pw-155564v3: 155564v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/index.html

--===============2054724637053573221==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable media sampler power gating (r=
ev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155564/">https://patchwork.freedesktop.org/series/155564/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155564v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155564v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3892-7896357960ab49751bdda502f7838b517=
30f9b51_FULL -&gt; xe-pw-155564v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155564v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155564v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1555=
64v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@single-move:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-434/igt@kms_cu=
rsor_legacy@single-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155564v3/shard-dg2-463/igt@kms_cursor_legacy@s=
ingle-move.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3892-7896357960ab49751bdda502f=
7838b51730f9b51_FULL and xe-pw-155564v3_FULL:</p>
<h3>New IGT tests (70)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-dp-4:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-b-hdmi-a-=
3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-c-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155564v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard=
-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_chamelium_hpd@common-hp=
d-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_content_protection@cont=
ent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@kms_flip@2x-fl=
ip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@km=
s_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-protection:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_get=
fb@getfb2-handle-protection.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@kms_getfb@getfb2=
-handle-protection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155564v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_oa@stress-open-close.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_pm@s=
2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_pm@s2idle-exec-after.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155564v3/shard-dg2-433/igt@xe_pmu@fn-engine-activity-s=
ched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6=
168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14968">i915#14968</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155564v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-155564v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-inter=
ruptible@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg=
-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@kms_fli=
p@dpms-off-confusion@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp=
-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html">PASS</a> +6 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9=
/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-4/igt@kms_fli=
p_event_leak@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-ad=
lp-1/igt@kms_flip_event_leak@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-bmg-6/igt@xe=
_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-463/igt@xe_exe=
c_threads@threads-cm-userptr-rebind.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard=
-dg2-434/igt@xe_exec_threads@threads-cm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-463/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/=
shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_i=
nit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-lnl-1/igt@xe_pmu@g=
t-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5841">Intel XE#5841</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-lnl-2/igt@xe_pmu@gt-frequency=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155564v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-=
dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1555=
64v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1555=
64v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155564v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155564v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1555=
64v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155564v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3=
/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155564v3/shard-bmg-7/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b5=
1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b5173=
0f9b51/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838=
b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502=
f7838b51730f9b51/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bd=
da502f7838b51730f9b51/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49=
751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-789635796=
0ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896=
357960ab49751bdda502f7838b51730f9b51/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892=
-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b51/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b51730f9b5=
1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838b5173=
0f9b51/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502f7838=
b51730f9b51/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bdda502=
f7838b51730f9b51/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49751bd=
da502f7838b51730f9b51/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3892-7896357960ab49=
751bdda502f7838b51730f9b51/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v=
3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155564v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5564v3/shard-adlp-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard=
-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155564v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
564v3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155564v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-=
adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155564v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155564v3/shard-adlp-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/s=
hard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155564v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155564v3/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612"=
>Intel XE#5612</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3892-7896357960ab49751bdda502f7838b51730f9b51 -&gt; xe-pw-155=
564v3</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3892-7896357960ab49751bdda502f7838b51730f9b51: 7896357960ab49751bdda50=
2f7838b51730f9b51<br />
  xe-pw-155564v3: 155564v3</p>

</body>
</html>

--===============2054724637053573221==--
