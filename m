Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA19C4452A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 13:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ABC10E933;
	Mon, 20 Jul 2026 13:20:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA7B10E92A;
 Mon, 20 Jul 2026 13:20:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0396119881906719014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/color=3A_Enable_S?=
 =?utf-8?q?DR_plane_color_pipeline_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jul 2026 13:20:17 -0000
Message-ID: <178455361776.207232.14134338715764433555@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260720045131.971650-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260720045131.971650-1-chaitanya.kumar.borah@intel.com>
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

--===============0396119881906719014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/color: Enable SDR plane color pipeline (rev6)
URL   : https://patchwork.freedesktop.org/series/162786/
State : success

== Summary ==

CI Bug Log - changes from xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1_FULL -> xe-pw-162786v6_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1_FULL and xe-pw-162786v6_FULL:

### New IGT tests (76) ###

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.25] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.22] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.22] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.04] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.24] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.24] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.22] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.22] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-160:
    - Statuses : 2 pass(s)
    - Exec time: [3.06, 8.35] s

  * igt@kms_pm_rpm@legacy-planes@plane-160:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 8.01] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-160:
    - Statuses : 2 pass(s)
    - Exec time: [2.91, 8.08] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-195:
    - Statuses : 2 pass(s)
    - Exec time: [2.66, 8.01] s

  * igt@kms_pm_rpm@universal-planes@plane-160:
    - Statuses : 2 pass(s)
    - Exec time: [2.95, 8.11] s

  * igt@kms_pm_rpm@universal-planes@plane-195:
    - Statuses : 2 pass(s)
    - Exec time: [2.97, 8.09] s

  

Known issues
------------

  Here are the changes found in xe-pw-162786v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] ([Intel XE#7084] / [Intel XE#8150])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4 (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#6969]) +40 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4 (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#6969]) +46 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4 (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#6969] / [Intel XE#7006])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4 (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6969] / [Intel XE#7006])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#4354] / [Intel XE#5870])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#8265])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#301])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4141])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#656] / [Intel XE#7905])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#1503])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2505] / [Intel XE#7447])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1489])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2234])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_psr@psr2-primary-render.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6503])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8374])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#8364]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-close-fd.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8369])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8378])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58]) -> ([PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [SKIP][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84]) ([Intel XE#2457] / [Intel XE#7405])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-10/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-10/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-9/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-8/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-5/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-6/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-9/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-4/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6964])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7793])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7590])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4733] / [Intel XE#7417])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [FAIL][89] ([Intel XE#7571]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][91] ([Intel XE#3098]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][93] ([Intel XE#301]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][95] ([Intel XE#3149] / [Intel XE#6266]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [DMESG-FAIL][97] ([Intel XE#8300]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@xe_exec_system_allocator@process-many-large-free-nomemset:
    - shard-bmg:          [ABORT][99] ([Intel XE#8300]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-free-nomemset.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-free-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [FAIL][101] ([Intel XE#8555]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0:
    - shard-lnl:          [FAIL][103] -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:
    - shard-lnl:          [SKIP][105] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][106] ([Intel XE#6969])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          [SKIP][107] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][108] ([Intel XE#6969])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][109] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][110] ([Intel XE#1729] / [Intel XE#7424])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][111] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][112] ([Intel XE#2509] / [Intel XE#7437])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][113] ([Intel XE#5545]) -> [ABORT][114] ([Intel XE#8007])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555


Build changes
-------------

  * Linux: xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1 -> xe-pw-162786v6

  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1: ef0406c67dd07054a91c04981283f0c2c6d7cbf1
  xe-pw-162786v6: 162786v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/index.html

--===============0396119881906719014==
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
<tr><td><b>Series:</b></td><td>drm/i915/color: Enable SDR plane color pipel=
ine (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162786/">https://patchwork.freedesktop.org/series/162786/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162786v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162786v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5436-ef0406c67dd07054a91c04981283f0c2c=
6d7cbf1_FULL -&gt; xe-pw-162786v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5436-ef0406c67dd07054a91c04981=
283f0c2c6d7cbf1_FULL and xe-pw-162786v6_FULL:</p>
<h3>New IGT tests (76)</h3>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-160:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.06, 8.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-160:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 8.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-160:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.91, 8.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-195:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.66, 8.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-160:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.95, 8.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-195:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.97, 8.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162786v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@device_r=
eset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@device_reset@unbind-=
reset-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg=
-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +40 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_color_pipeline@plane-lut=
1d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +46 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-lnl-1/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-c-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_cursor_crc@cursor-random=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-lnl-5/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
shdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
hdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505=
">Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_psr@psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@kms_sharpness_filter@invalid=
-filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_multi_queue@few-exec=
s-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_reset@multi-queue-cl=
ose-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf=
1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6=
d7cbf1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0=
c2c6d7cbf1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c049812=
83f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c0=
4981283f0c2c6d7cbf1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a=
91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07=
054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67=
dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-ef040=
6c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5436-e=
f0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-54=
36-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162786v6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62786v6/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-162786v6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162786v6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-162786v6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-162786v6/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-162786v6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-162786v6/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-162786v6/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency=
-copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_page_reclaim@binds-large-=
split.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_pat@xa-app-transient-medi=
a-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162786v6/shard-bmg-10/igt@xe_pxp@pxp-termination-key-u=
pdate-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard=
-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shar=
d-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-8/igt@kms_flip=
@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard=
-lnl-5/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/sh=
ard-bmg-10/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-9/igt@xe_exec_=
system_allocator@process-many-large-free-nomemset.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1627=
86v6/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-free-nome=
mset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel=
 XE#8555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-162786v6/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_=
xe_engine_class_copy0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6=
/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_cl=
ass_render0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-lnl-3/igt@kms_colo=
r_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">In=
tel XE#7006</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-162786v6/shard-lnl-1/igt@kms_color_pipeline@plane-lut3d-green-only@p=
ipe-c-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6969">Intel XE#6969</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-1/igt@kms_colo=
r_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">In=
tel XE#7006</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-162786v6/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@p=
ipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6969">Intel XE#6969</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shar=
d-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-162786v6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1/shard-bmg-5/igt@xe_wedge=
d@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v6/shard-bmg-4/igt@x=
e_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1 -&gt; xe-pw-162=
786v6</li>
</ul>
<p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5436-ef0406c67dd07054a91c04981283f0c2c6d7cbf1: ef0406c67dd07054a91c049=
81283f0c2c6d7cbf1<br />
  xe-pw-162786v6: 162786v6</p>

</body>
</html>

--===============0396119881906719014==--
