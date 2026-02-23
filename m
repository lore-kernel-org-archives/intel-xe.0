Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38249E98DEF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 07:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6CC10E262;
	Mon, 23 Feb 2026 07:23:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EDE10E1F4;
 Mon, 23 Feb 2026 07:23:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7473613600239937205=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Workaround_cleanup_=26_sim?=
 =?utf-8?q?plification_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 07:23:50 -0000
Message-ID: <177183143057.273936.10060406247840829974@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
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

--===============7473613600239937205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Workaround cleanup & simplification (rev2)
URL   : https://patchwork.freedesktop.org/series/161606/
State : failure

== Summary ==

CI Bug Log - changes from xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL -> xe-pw-161606v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161606v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161606v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161606v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  
New tests
---------

  New tests have been introduced between xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL and xe-pw-161606v2_FULL:

### New IGT tests (90) ###

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-161606v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7059])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969] / [Intel XE#7006])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#6707])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1424])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#309])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#6266]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#1503])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4090])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2426])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#4459]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2322]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7136])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7136]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6874])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6874]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7138])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2284])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_pm@d3cold-mocs.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][51] ([Intel XE#367]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6321]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-lnl:          [ABORT][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-4/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [ABORT][59] -> [PASS][60] +1 other test pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][61] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][62] ([Intel XE#3544])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][63] ([Intel XE#2509]) -> [SKIP][64] ([Intel XE#2426])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][65] ([Intel XE#5466]) -> [ABORT][66] ([Intel XE#5466] / [Intel XE#6652])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283


Build changes
-------------

  * Linux: xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13 -> xe-pw-161606v2

  IGT_8764: 8764
  xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13
  xe-pw-161606v2: 161606v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/index.html

--===============7473613600239937205==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Workaround cleanup &amp; simplification (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161606/">https://patchwork.freedesktop.org/series/161606/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL -&gt; xe-pw-161606v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161606v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161606v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161606v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL and xe-pw-161606v2_FULL:</p>
<h3>New IGT tests (90)</h3>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161606v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-4/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13 -&gt; xe-pw-161606v2</li>
</ul>
<p>IGT_8764: 8764<br />
  xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13<br />
  xe-pw-161606v2: 161606v2</p>

</body>
</html>

--===============7473613600239937205==--
