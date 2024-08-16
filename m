Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF3C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 22:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230610E85C;
	Fri, 16 Aug 2024 22:58:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680D10E85B;
 Fri, 16 Aug 2024 22:58:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1141350778239429637=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Introducing_Xe2_ccs_modifiers_f?=
 =?utf-8?q?or_integrated_and_discrete_graphics_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 22:58:22 -0000
Message-ID: <172384910266.659321.14551016320390369102@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816115229.531671-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240816115229.531671-1-juhapekka.heikkila@gmail.com>
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

--===============1141350778239429637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introducing Xe2 ccs modifiers for integrated and discrete graphics (rev2)
URL   : https://patchwork.freedesktop.org/series/137207/
State : failure

== Summary ==

CI Bug Log - changes from xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full -> xe-pw-137207v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137207v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137207v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137207v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_auth@getclient-simple:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@core_auth@getclient-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@core_auth@getclient-simple.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4 (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][3] +28 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-5/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4.html

  * {igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4} (NEW):
    - {shard-bmg}:        NOTRUN -> [FAIL][4] +63 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +17 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][7] ([Intel XE#1201] / [Intel XE#656]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [PASS][9] -> [FAIL][10] +13 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][11] ([Intel XE#2436]) -> [FAIL][12] +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
    - {shard-bmg}:        [DMESG-WARN][13] ([Intel XE#877]) -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html

  
New tests
---------

  New tests have been introduced between xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full and xe-pw-137207v2_full:

### New IGT tests (88) ###

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-linear-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-linear:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-x:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-unknown:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-137207v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#1033])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1231]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1399]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-adlp:         [PASS][32] -> [SKIP][33] ([Intel XE#1201]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#776])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#703])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1421])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#1195]) +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1397]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#324]) +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#651]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#1861])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#656]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#653]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#417])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#324]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#616]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1874]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][61] ([Intel XE#718])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-adlp:         [PASS][62] -> [SKIP][63] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_properties@plane-properties-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1489])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1406])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#771] / [Intel XE#899])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][68] -> [FAIL][69] ([Intel XE#899])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][70] -> [FAIL][71] ([Intel XE#899])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#2028]) +5 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#2443]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-7/igt@kms_vrr@flipline.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1473] / [Intel XE#402])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#688]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][81] -> [INCOMPLETE][82] ([Intel XE#1195] / [Intel XE#1473])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate:
    - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#1069])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@xe_exec_compute_mode@many-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_intel_bb@purge-bb:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#1727] / [Intel XE#2226])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@xe_intel_bb@purge-bb.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_intel_bb@purge-bb.html

  * igt@xe_oa@blocking:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#2541])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_oa@blocking.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2284] / [Intel XE#366])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#1191] / [Intel XE#2226])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][93] -> [DMESG-WARN][94] ([Intel XE#2019]) +1 other test dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][95] -> [ABORT][96] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][97] -> [ABORT][98] ([Intel XE#1607] / [Intel XE#1794])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#944])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs:
    - shard-adlp:         [PASS][100] -> [DMESG-WARN][101] ([Intel XE#2226]) +7 other tests dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - {shard-bmg}:        [DMESG-WARN][102] ([Intel XE#1033]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][104] ([Intel XE#1033]) -> [PASS][105] +1 other test pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-adlp:         [SKIP][106] ([Intel XE#1201]) -> [PASS][107] +12 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_atomic_interruptible@legacy-cursor.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][108] ([Intel XE#1426]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][110] ([Intel XE#1426]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][112] ([Intel XE#1426]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][114] ([Intel XE#1231]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][116] ([Intel XE#1874]) -> [PASS][117] +7 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][118] ([Intel XE#886]) -> [PASS][119] +3 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@wf_vblank-ts-check:
    - {shard-bmg}:        [INCOMPLETE][120] -> [PASS][121] +3 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
    - shard-dg2-set2:     [INCOMPLETE][122] -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][124] ([Intel XE#324]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-WARN][126] ([Intel XE#324]) -> [PASS][127] +2 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_cursor@viewport:
    - {shard-bmg}:        [DMESG-WARN][128] ([Intel XE#877]) -> [PASS][129] +6 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_plane_cursor@viewport.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-3/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][130] ([Intel XE#718]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - {shard-bmg}:        [FAIL][132] ([Intel XE#2517]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][134] ([Intel XE#899]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][136] -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [FAIL][138] ([Intel XE#2028]) -> [PASS][139] +7 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][140] ([Intel XE#1473]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][142] ([Intel XE#1473]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_balancer@no-exec-virtual-rebind:
    - shard-adlp:         [DMESG-WARN][144] ([Intel XE#2226]) -> [PASS][145] +19 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_balancer@no-exec-virtual-rebind.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_exec_balancer@no-exec-virtual-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#2226] / [Intel XE#358]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][148] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#2019] / [Intel XE#2280]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#623]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#623])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][155] ([Intel XE#316])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#316]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][158] ([Intel XE#1201]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#316])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1124]) -> [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][162] ([Intel XE#324]) -> [FAIL][163] ([Intel XE#1231]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][164] ([Intel XE#1231]) -> [DMESG-FAIL][165] ([Intel XE#324])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][167] ([Intel XE#1124]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-adlp:         [SKIP][168] ([Intel XE#1201]) -> [SKIP][169] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#610]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#610])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][173] ([Intel XE#346])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2191]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#2191])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][177] ([Intel XE#2191]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][178] ([Intel XE#1201]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#2191])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][181] ([Intel XE#367]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][183] ([Intel XE#1201])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#367]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-adlp:         [SKIP][186] ([Intel XE#1201]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
    - shard-adlp:         [SKIP][188] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][189] ([Intel XE#1201]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1252]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#1252])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][193] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][197] ([Intel XE#787]) +62 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][199] ([Intel XE#1252])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#787]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][203] ([Intel XE#314]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][205] ([Intel XE#1152]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#306]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#306])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][209] ([Intel XE#306])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#373]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][213] ([Intel XE#373]) +8 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         [SKIP][214] ([Intel XE#1201]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_content_protection@atomic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [FAIL][216] ([Intel XE#1178]) -> [INCOMPLETE][217] ([Intel XE#1195]) +1 other test incomplete
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_content_protection@atomic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][219] ([Intel XE#455]) +14 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][220] ([Intel XE#1201]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#309])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         [SKIP][222] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][223] ([Intel XE#1201])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][225] ([Intel XE#323]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#323]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#323])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][229] ([Intel XE#307])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [i915#3804]) -> [SKIP][231] ([i915#3804])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#776]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#776])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1138]) -> [SKIP][235] ([Intel XE#1138] / [Intel XE#1201])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#455]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][238] ([Intel XE#1201]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#651])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][241] ([Intel XE#651]) +21 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-adlp:         [FAIL][242] -> [SKIP][243] ([Intel XE#1201] / [Intel XE#651])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#651]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][246] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][247] ([Intel XE#1201])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][248] ([Intel XE#1201]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][250] ([Intel XE#1201]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#653])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][253] ([Intel XE#1158])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#653]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][257] ([Intel XE#653]) +21 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][259] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][261] ([Intel XE#498]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][263] ([Intel XE#2318]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][265] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#870]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#870])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][269] ([Intel XE#1122])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][271] ([Intel XE#908])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1489]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][275] ([Intel XE#1489]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1122]) -> [SKIP][277] ([Intel XE#1122] / [Intel XE#1201])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#929]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][281] ([Intel XE#929]) +12 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1149]) -> [SKIP][283] ([Intel XE#1149] / [Intel XE#1201])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][285] ([Intel XE#1149])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         [SKIP][286] ([Intel XE#1201]) -> [FAIL][287] ([Intel XE#1874]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1127]) -> [SKIP][289] ([Intel XE#1127] / [Intel XE#1201])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][291] ([Intel XE#756])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#756]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#756])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][295] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1123]) -> [SKIP][297] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][299] ([Intel XE#1126]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][300] ([Intel XE#1195] / [Intel XE#1473]) -> [TIMEOUT][301] ([Intel XE#1041] / [Intel XE#1473])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][302] ([Intel XE#1473]) -> [INCOMPLETE][303] ([Intel XE#1195] / [Intel XE#1473])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][305] ([Intel XE#288]) +21 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#288]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2360]) -> [SKIP][309] ([Intel XE#1201] / [Intel XE#2360])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#255]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#255])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][312] ([Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][313] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_module_load@many-reload.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     [FAIL][314] ([Intel XE#2136]) -> [DMESG-WARN][315] ([Intel XE#2019])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_module_load@many-reload.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@xe_module_load@many-reload.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][317] ([Intel XE#2541]) +5 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_oa@disabled-read-error.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2541]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1337]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#1337])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][323] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][324] ([Intel XE#1162] / [Intel XE#569]) -> [DMESG-WARN][325] ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#579]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#579])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][329] ([Intel XE#944]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#944]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#944])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2517
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7972 -> IGT_7973
  * Linux: xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c -> xe-pw-137207v2

  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c: 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
  xe-pw-137207v2: 137207v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/index.html

--===============1141350778239429637==
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
<tr><td><b>Series:</b></td><td>Introducing Xe2 ccs modifiers for integrated and discrete graphics (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137207/">https://patchwork.freedesktop.org/series/137207/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full -&gt; xe-pw-137207v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137207v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137207v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137207v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_auth@getclient-simple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@core_auth@getclient-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@core_auth@getclient-simple.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-5/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4.html">FAIL</a> +28 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4} (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_plane@pixel-format@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full and xe-pw-137207v2_full:</p>
<h3>New IGT tests (88)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-3-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-3-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-4-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-linear-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-linear:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-unknown-to-x:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-3-x-to-unknown:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137207v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_properties@plane-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@xe_evict@evict-beng-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@xe_exec_compute_mode@many-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@purge-bb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@xe_intel_bb@purge-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_intel_bb@purge-bb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max@vecs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_atomic_interruptible@legacy-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +3 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_plane_cursor@viewport.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-3/igt@kms_plane_cursor@viewport.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2517">Intel XE#2517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_balancer@no-exec-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@xe_exec_balancer@no-exec-virtual-rebind.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-adlp-2/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-463/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137207v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7972 -&gt; IGT_7973</li>
<li>Linux: xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c -&gt; xe-pw-137207v2</li>
</ul>
<p>IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c: 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c<br />
  xe-pw-137207v2: 137207v2</p>

</body>
</html>

--===============1141350778239429637==--
