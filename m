Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A90BCA0EED
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 08:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6210E6BD;
	Wed, 20 Aug 2025 08:41:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA5D10E362;
 Wed, 20 Aug 2025 08:41:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1897895174789184350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_auxccs_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Aug 2025 08:41:55 -0000
Message-ID: <175567931510.251284.16355316207002111436@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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

--===============1897895174789184350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: auxccs test (rev2)
URL   : https://patchwork.freedesktop.org/series/153065/
State : success

== Summary ==

CI Bug Log - changes from xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa_FULL -> xe-pw-153065v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa_FULL and xe-pw-153065v2_FULL:

### New IGT tests (44) ###

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  

Known issues
------------

  Here are the changes found in xe-pw-153065v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#367])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#787]) +188 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2887])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5] ([Intel XE#2705] / [Intel XE#4212]) +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][6] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][10] ([Intel XE#1178]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2291]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#1475])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#4494])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#3009])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_dp_aux_dev.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#4354])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#776])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2316]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#2049] / [Intel XE#2597])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#2049] / [Intel XE#2597])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#301] / [Intel XE#3149])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2313])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1503])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_psr@pr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#5899])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4837])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#1392]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2322])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][44] -> [ABORT][45] ([Intel XE#5729])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@xe_pm@s2idle-basic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-2/igt@xe_pm@s2idle-basic.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][48] ([Intel XE#4543]) -> [PASS][49] +18 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][50] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][52] ([Intel XE#787]) -> [PASS][53] +85 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][54] ([Intel XE#455] / [Intel XE#787]) -> [PASS][55] +56 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][56] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][58] ([Intel XE#2291]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][60] ([Intel XE#4633]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][62] ([Intel XE#2316]) -> [PASS][63] +3 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][64] ([Intel XE#4543]) -> [PASS][65] +25 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [DMESG-WARN][66] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][67] +2 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][71] +14 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][72] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [SKIP][74] ([Intel XE#455]) -> [PASS][75] +7 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][76] ([Intel XE#5671]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][78] ([Intel XE#4596]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][80] ([Intel XE#2571]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1392]) -> [PASS][83] +5 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-bmg:          [FAIL][84] ([Intel XE#5536]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][86] ([Intel XE#5536]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#5841]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-433/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][90] ([Intel XE#455] / [Intel XE#787]) -> [DMESG-WARN][91] ([Intel XE#2953] / [Intel XE#4173])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         [SKIP][92] ([Intel XE#787]) -> [DMESG-WARN][93] ([Intel XE#2953] / [Intel XE#4173])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][94] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][95] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][97] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][98] ([Intel XE#2341]) -> [FAIL][99] ([Intel XE#1178])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][100] ([Intel XE#2311]) -> [SKIP][101] ([Intel XE#2312]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][102] ([Intel XE#2312]) -> [SKIP][103] ([Intel XE#2311]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][104] ([Intel XE#5390]) -> [SKIP][105] ([Intel XE#2312]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][106] ([Intel XE#2312]) -> [SKIP][107] ([Intel XE#5390]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][108] ([Intel XE#2313]) -> [SKIP][109] ([Intel XE#2312]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][110] ([Intel XE#2312]) -> [SKIP][111] ([Intel XE#2313]) +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][112] ([Intel XE#3325]) -> [SKIP][113] ([Intel XE#734])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#362]) -> [FAIL][115] ([Intel XE#1729])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][116] ([Intel XE#2509]) -> [SKIP][117] ([Intel XE#2426])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#362]) -> [SKIP][119] ([Intel XE#1500])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][120] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][121] ([Intel XE#5466])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [DMESG-WARN][122] ([Intel XE#3876]) -> [ABORT][123] ([Intel XE#3970])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5536
  [Intel XE#5671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671
  [Intel XE#5729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5729
  [Intel XE#5841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -> xe-pw-153065v2

  IGT_8497: 8497
  xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa
  xe-pw-153065v2: 153065v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/index.html

--===============1897895174789184350==
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
<tr><td><b>Series:</b></td><td>auxccs test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153065/">https://patchwork.freedesktop.org/series/153065/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153065v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153065v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3576-deb6c5d08f8b84ea7e019b7682631c637=
5cc17aa_FULL -&gt; xe-pw-153065v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3576-deb6c5d08f8b84ea7e019b768=
2631c6375cc17aa_FULL and xe-pw-153065v2_FULL:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-linear-to-y-mc-cc=
s:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-linea=
r:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-=
mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-linear-to-y-mc-cc=
s:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-linea=
r:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-cc-to-y-=
mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-rc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-mc-cc=
s:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-linea=
r:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-cc-to-y-=
mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-rc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-linear-to-y-mc-cc=
s:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-linea=
r:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-mc-ccs-to-y-rc-=
ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-cc-to-y-=
mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-rc-ccs-to-y-mc-=
ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153065v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +188 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">In=
tel XE#4212</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_content_protection@atom=
ic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_flip=
@2x-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_flip@2x-absolute-w=
f_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend=
@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-3/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-lnl-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@kms_psr@pr-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">In=
tel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5899">Intel XE#5899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_rot=
ation_crc@multiplane-rotation-cropping-bottom.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-1/i=
gt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@xe_eudebug_online@debugger-re=
open.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/sha=
rd-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-b=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-6/igt@xe_exec_reset@gt-rese=
t-stress.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5729">Intel XE#5729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153065v2/shard-adlp-2/igt@xe_pm@s2idle-basic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/295=
3">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-153065v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153065v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs=
@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53065v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pi=
pe-a-hdmi-a-1.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_ccs=
@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153065v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-=
ccs.html">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-4=
36/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-4/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg=
-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53065v2/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hd=
mi-a1.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-9/igt@kms_fli=
p@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
65v2/shard-adlp-6/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
65v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-153065v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153065v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-val=
id-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">PAS=
S</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5671">Intel XE#5671=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
65v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip=
-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-5/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-463/=
igt@xe_exec_basic@multigpu-no-exec-rebind.html">PASS</a> +5 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-8/igt@xe_exec_=
fault_mode@many-bindexecqueue-rebind.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5536">Intel XE#5536</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-=
7/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5536">Intel XE#=
5536</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153065v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-u=
serptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5841">Intel XE#5841</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-433/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs=
@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53065v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-c=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-6/igt@kms_ccs=
@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153065v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-c=
cs-cc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-435/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#31=
13</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/434=
5">Intel XE#4345</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg-2/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
65v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1530=
65v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3065v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
065v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53065v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-adlp-1/igt@kms_pm_dc@dc9-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-dg2-436/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/sha=
rd-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-lnl-1/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153065v2/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa/shard-bmg-7/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153065v2/shard-bmg=
-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>=
)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -&gt; xe-pw-153=
065v2</li>
</ul>
<p>IGT_8497: 8497<br />
  xe-3576-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7=
682631c6375cc17aa<br />
  xe-pw-153065v2: 153065v2</p>

</body>
</html>

--===============1897895174789184350==--
